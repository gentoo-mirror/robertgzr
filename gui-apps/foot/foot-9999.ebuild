# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit meson

DESCRIPTION="fast, lightweight and minimalistic Wayland terminal emulator "
HOMEPAGE="https://codeberg.org/dnkl/foot"

if [[ ${PV} = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://codeberg.org/dnkl/${PN}.git"
else
	TLLIST_PV="1.0.4"
	FCFT_PV="2.3.0"
	SRC_URI="https://codeberg.org/dnkl/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
	SRC_URI+="
		https://codeberg.org/dnkl/tllist/archive/${TLLIST_PV}.tar.gz -> tllist-${TLLIST_PV}.tar.gz
		https://codeberg.org/dnkl/fcft/archive/${FCFT_PV}.tar.gz -> fcft-${FCFT_PV}.tar.gz"
	KEYWORDS="~amd64 ~x86 ~arm64"
fi


LICENSE="MIT"
SLOT="0"
IUSE="+man"

DEPEND="
	media-libs/freetype
	media-libs/fontconfig
	x11-libs/pixman
	x11-libs/libxkbcommon
"
RDEPEND="${DEPEND}"

BDEPEND="
	dev-libs/wayland
	dev-libs/wayland-protocols
	sys-libs/ncurses
	man? ( app-text/scdoc )
"

if [[ ${PV} != 9999 ]]; then
	S="${WORKDIR}/${PN}"
fi

src_unpack() {
	default

	mkdir -p "${S}/subprojects"
	if [[ ${PV} == 9999 ]]; then
		git-r3_src_unpack
		git-r3_fetch "https://codeberg.org/dnkl/tllist.git"
		git-r3_checkout "https://codeberg.org/dnkl/tllist.git" "${S}/subprojects/tllist"
		git-r3_fetch "https://codeberg.org/dnkl/fcft.git"
		git-r3_checkout "https://codeberg.org/dnkl/fcft.git" "${S}/subprojects/fcft"
	else
		mv "${WORKDIR}/tllist" "${S}/subprojects/tllist"
		mv "${WORKDIR}/fcft" "${S}/subprojects/fcft"
	fi

}

src_install() {
	meson_src_install
	rm -r "${D}/usr/share/doc/foot"
}
