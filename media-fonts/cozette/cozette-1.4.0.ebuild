# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit font

DESCRIPTION="A bitmap programming font optimized for coziness"
HOMEPAGE="https://github.com/slavfox/Cozette"

SRC_URI="https://github.com/slavfox/${PN}/releases/download/v.${PV}/${PN}Vector.otf -> ${PN}Vector-${PV}.otf
	otb? ( https://github.com/slavfox/${PN}/releases/download/v.${PV}/${PN}.otb -> ${P}.otb )
"

LICENSE="OFL-1.1"
SLOT="0"
IUSE="otb"
KEYWORDS="~amd64 ~arm ~arm64 ~ppc64 ~x86"

S="${DISTDIR}"
FONT_S="${S}"
FONT_SUFFIX="otf"

src_prepare() {
	default

	if use otb; then
		FONT_SUFFIX+=" otb"
	fi
}
