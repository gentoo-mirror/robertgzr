# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit meson

DESCRIPTION="Control the mouse pointer with the keyboard on Wayland"
HOMEPAGE="https://github.com/moverest/wl-kbptr"

inherit git-r3
EGIT_REPO_URI="https://github.com/moverest/wl-kbptr"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE="opencv"

DEPEND="
	dev-libs/wayland
	dev-libs/wayland-protocols
	x11-libs/cairo
	x11-libs/libxkbcommon
	opencv? (
		x11-libs/pixman
		media-libs/opencv
	)
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	local emesonargs=(
		$(meson_feature opencv)
	)
	meson_src_configure
}
