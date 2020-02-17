# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit meson

DESCRIPTION="Displays keypresses on screen"
HOMEPAGE="https://git.sr.ht/~sircmpwn/wshowkeys"

if [[ ${PV} = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://git.sr.ht/~sircmpwn/${PN}"
else
	exit 1
fi

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

BDEPEND="
	dev-libs/libinput
	dev-libs/wayland
	dev-libs/wayland-protocols
	virtual/udev
	x11-libs/cairo
	x11-libs/libxkbcommon
	x11-libs/pango
"

src_install() {
	meson_src_install
	chmod a+s "${D}/usr/bin/wshowkeys"
}
