# Copyright 2020-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit meson

DESCRIPTION="animated wallpaper daemon"
HOMEPAGE="https://github.com/vilhalmer/oguri"

if [[ ${PV} = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/vilhalmer/${PN}.git"
else
	SRC_URI="https://github.com/vilhalmer/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
fi

LICENSE="MIT"
SLOT="0"
IUSE=""
KEYWORDS="~amd64 ~arm64 ~x86"

BDEPEND="
	dev-libs/wayland
	dev-libs/wayland-protocols
"

src_install() {
	dobin contrib/oguri-swaybg
	meson_src_install
}
