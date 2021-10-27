# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

DESCRIPTION=""
HOMEPAGE="https://musikcube.com/"

if [[ $PV = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI=https://github.com/clangen/musikcube
else
	SRC_URI="https://github.com/clangen/musikcube/archive/${PV}.tar.gz"
fi

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+pipewire +pulseaudio +alsa mpt vorbis ogg ffmpeg server systemd +elogind sndio +mpris"

DEPEND="
	dev-libs/boost
	dev-libs/libev
	alsa? ( media-libs/alsa-lib )
	ffmpeg? ( media-video/ffmpeg )
	ogg? ( media-libs/libogg )
	mpt? ( media-libs/libopenmpt )
	vorbis? ( media-libs/libvorbis )
	media-libs/taglib
	net-misc/curl
	sys-libs/zlib
	net-libs/libmicrohttpd
	pipewire? ( media-video/pipewire )
	pulseaudio? ( media-sound/pulseaudio )
"
RDEPEND="${DEPEND}"
BDEPEND=""

PATCHES=(
	"${FILESDIR}/0001-homedir-fix.patch"
	"${FILESDIR}/0002-cmake-allow-disabling-pulse-and-alsa.patch"
	"${FILESDIR}/0003-cmake-allow-disabling-server-plugin.patch"
	"${FILESDIR}/0004-cmake-elogind-fallback.patch"
	"${FILESDIR}/0005-cmake-fix-ncurses-not-finding-tinfo.patch"
)

src_configure() {
	local mycmakeargs=(
		-DENABLE_ALSA=$(usex alsa true false)
		-DENABLE_PIPEWIRE=$(usex pipewire true false)
		-DENABLE_PULSEAUDIO=$(usex pulseaudio true false)
		-DENABLE_MPRIS=$(usex mpris true false)
		-DENABLE_SNDIO=$(usex sndio true false )
		-DENABLE_FFMPEG=$(usex ffmpeg true false)
		-DENABLE_LIBMICROHTTP=$(usex server true false)
		-DENABLE_SYSTEMD=$(usex systemd true false)
		-DENABLE_ELOGIND=$(usex elogind true false)
		-DENABLE_BUNDLED_TAGLIB=false
	)
	cmake_src_configure
}
