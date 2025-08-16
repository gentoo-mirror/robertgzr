# Copyright 2024-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Fast, feature-rich, and cross-platform terminal emulator"
HOMEPAGE="https://ghostty.org/"

MY_PV="${PV}.0.0-gentoo"
ZIG_SLOT="0.14"
ZIG_NEEDS_LLVM=1
inherit zig xdg git-r3

EGIT_REPO_URI="https://github.com/ghostty-org/ghostty"

LICENSE="
	Apache-2.0 BSD BSD-2 BSD-4 Boost-1.0 MIT MPL-2.0
	!system-freetype? ( || ( FTL GPL-2+ ) )
	!system-harfbuzz? ( Old-MIT ISC icu )
	!system-libpng? ( libpng2 )
	!system-zlib? ( ZLIB )
"
SLOT="0"
KEYWORDS="~amd64"

# TODO: simdutf integration (missing Gentoo version)
# TODO: spirv-cross integration (missing Gentoo package)
RDEPEND="
	gui-libs/gtk:4=[X?]
	gui-libs/libadwaita:1=

	X? ( x11-libs/libX11 )
	system-fontconfig? ( >=media-libs/fontconfig-2.14.2:= )
	system-freetype? (
		system-harfbuzz? ( >=media-libs/freetype-2.13.2:=[bzip2,harfbuzz] )
		!system-harfbuzz? ( >=media-libs/freetype-2.13.2:=[bzip2] )
	)
	system-fontconfig? ( >=media-libs/fontconfig-2.14.2:= )
	system-freetype? ( >=media-libs/freetype-2.13.2:=[bzip2] )
	system-glslang? ( >=dev-util/glslang-1.3.296.0:= )
	system-harfbuzz? ( >=media-libs/harfbuzz-8.4.0:= )
	system-libpng? ( >=media-libs/libpng-1.6.43:= )
	system-libxml2? ( >=dev-libs/libxml2-2.11.5:= )
	system-oniguruma? ( >=dev-libs/oniguruma-6.9.9:= )
	system-zlib? ( >=sys-libs/zlib-1.3.1:= )
	system-gtk4layershell? ( gui-libs/gtk4-layer-shell )
"
DEPEND="${RDEPEND}"
BDEPEND="
	man? ( virtual/pandoc )
"

IUSE="+X +adwaita man"
# System integrations
IUSE+=" +system-fontconfig +system-freetype +system-glslang +system-harfbuzz +system-libpng +system-libxml2"
IUSE+=" +system-oniguruma +system-zlib"
IUSE+=" +system-gtk4layershell"

# XXX: Because we set --release=fast below, Zig will automatically strip
#      the binary. Until Ghostty provides a way to disable the banner while
#      having debug symbols we have ignore pre-stripped file warnings.
QA_PRESTRIPPED="usr/bin/ghostty"

PATCHES=(
	"${FILESDIR}"/${PN}-1.1-bzip2-dependency.patch
	"${FILESDIR}"/${PN}-1.1-copy-terminfo-using-installdir.patch
)

src_unpack() {
	git-r3_src_unpack
	zig_live_fetch
}

src_configure() {
	local my_zbs_args=(
		# XXX: Ghostty displays a banner saying it is a debug build unless ReleaseFast is used.
		--release=fast

		-Dapp-runtime=gtk-ng
		-Dfont-backend=fontconfig_freetype
		-Drenderer=opengl
		-Dgtk-x11=$(usex X true false)
		-Demit-docs=$(usex man true false)
		-Dversion-string="${MY_PV}"

		-Demit-terminfo=false
		-Demit-termcap=false

		-fno-sys=simdutf
		-fno-sys=spirv-cross
		-f$(usex system-fontconfig sys no-sys)=fontconfig
		-f$(usex system-freetype sys no-sys)=freetype
		-f$(usex system-glslang sys no-sys)=glslang
		-f$(usex system-harfbuzz sys no-sys)=harfbuzz
		-f$(usex system-libpng sys no-sys)=libpng
		-f$(usex system-oniguruma sys no-sys)=oniguruma
		-f$(usex system-zlib sys no-sys)=zlib
		-f$(usex system-gtk4layershell sys no-sys)=gtk4-layer-shell
	)

	zig_src_configure
}

src_install() {
	zig_src_install

	# HACK: fixup QA notice
	mv ${D}/usr/share/bash-completion/completions/ghostty.bash \
	   ${D}/usr/share/bash-completion/completions/ghostty
}
