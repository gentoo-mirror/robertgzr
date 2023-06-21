# Copyright 2020-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit font

DESCRIPTION="A bitmap programming font optimized for coziness"
HOMEPAGE="https://github.com/slavfox/Cozette"

SRC_URI="
	otb? ( https://github.com/slavfox/${PN}/releases/download/v.${PV}/${PN}.otb -> ${P}.otb )
	hidpi? ( https://github.com/slavfox/${PN}/releases/download/v.${PV}-hidpi/${PN}Vector.otf -> ${PN}Vector-${PV}.otf )
	!hidpi? ( https://github.com/slavfox/${PN}/releases/download/v.${PV}/${PN}Vector.otf -> ${PN}Vector-${PV}.otf )
"

LICENSE="OFL-1.1"
SLOT="0"
IUSE="otb hidpi"
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
