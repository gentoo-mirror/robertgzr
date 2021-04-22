# Copyright 2020-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit font

DESCRIPTION="Slender typeface for code, from code"
HOMEPAGE="https://be5invis.github.io/Iosevka/"

MY_PV=$(ver_rs 3 '-' 4 '.')

SRC_URI="https://github.com/be5invis/${PN}/releases/download/v${MY_PV}/01-${PN}-${MY_PV}.zip
	term? ( https://github.com/be5invis/${PN}/releases/download/v${MY_PV}/02-${PN}-term-${MY_PV}.zip )
	type? ( https://github.com/be5invis/${PN}/releases/download/v${MY_PV}/03-${PN}-type-${MY_PV}.zip )
	cc? ( https://github.com/be5invis/${PN}/releases/download/v${MY_PV}/04-${PN}-cc-${MY_PV}.zip )
	slab? ( https://github.com/be5invis/${PN}/releases/download/v${MY_PV}/05-${PN}-slab-${MY_PV}.zip )
"

LICENSE="OFL-1.1"
SLOT="0"
IUSE="+term type cc slab"
KEYWORDS="~amd64 ~arm ~arm64 ~ppc64 ~x86"

DEPEND="app-arch/unzip"

S="${WORKDIR}"
FONT_S="${S}/ttf"
FONT_SUFFIX="ttf"
