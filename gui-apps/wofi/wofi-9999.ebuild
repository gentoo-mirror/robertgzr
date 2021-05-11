# Copyright 2020-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit meson

DESCRIPTION="launcher/menu program for wlroots based wayland compositors"
HOMEPAGE="https://cloudninja.pw/docs/wofi.html"

if [[ ${PV} = *9999* ]]; then
	inherit mercurial
	EHG_REPO_URI="https://hg.sr.ht/~scoopta/${PN}"
else
	SRC_URI="https://hg.sr.ht/~scoopta/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~arm64 ~x86"
fi

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

BDEPEND="
	dev-libs/wayland
	x11-libs/gtk+
"

src_configure() {
	if [[ ${PV} != *9999* ]]; then
		local emesonargs=(
			-Dversion=${PV}
		)
	fi
	meson_src_configure
}
