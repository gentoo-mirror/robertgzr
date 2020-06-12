# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3 savedconfig

DESCRIPTION="wayland compositor inspired by dwm"
HOMEPAGE="https://github.com/djpohly/dwl"
EGIT_REPO_URI="https://github.com/djpohly/dwl"

LICENSE="GPL-3"
SLOT="0"
IUSE="elogind systemd X"
KEYWORDS="~amd64"

DEPEND="
	>=dev-libs/libinput-1.6.0:0=
	dev-libs/glib
	dev-libs/libpcre
	dev-libs/libucl
	dev-libs/wayland
	x11-libs/cairo
	x11-libs/libxkbcommon
	x11-libs/pango
	x11-libs/pixman
	>=gui-libs/wlroots-0.10.0:=[elogind=,systemd=,X=]
"
# DEPEND+="
# 	>=gui-libs/wlroots-0.10.0:=[elogind=,systemd=,X=]
# 	<gui-libs/wlroots-0.11.0:=[elogind=,systemd=,X=]
# "
BDEPEND="
	>=dev-libs/wayland-protocols-1.14
	virtual/pkgconfig
	sys-devel/bmake
"

src_prepare() {
	default

	restore_config config.h
}

src_install() {
	dobin dwl
	dodoc README.md

	save_config config.h
}
