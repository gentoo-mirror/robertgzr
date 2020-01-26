# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit font

FONT_PN="Rosario"
DESCRIPTION="Classic semiserif typeface, ideal for magazines and academic journals"
HOMEPAGE="https://www.omnibus-type.com/fonts/rosario/"

SRC_URI="https://www.omnibus-type.com/wp-content/uploads/Rosario.zip -> ${P}.zip"

LICENSE="OFL-1.1"
SLOT="0"
IUSE="+otf ttf woff woff2 eot"
KEYWORDS="~amd64 ~arm ~arm64 ~ppc64 ~x86"

DEPEND="app-arch/unzip"

S="${WORKDIR}/${FONT_PN}"

src_prepare() {
	default

	FONT_S="$(usev otf ${S}/otf)"
	FONT_S+="$(usev ttf ${S}/ttf)"
	FONT_S+="$(usev woff ${S}/woff)"
	FONT_S+="$(usev woff2 ${S}/woff2)"
	FONT_S+="$(usev eot ${S}/eot)"

	FONT_SUFFIX="$(usev otf otf)"
	FONT_SUFFIX+="$(usev ttf ttf)"
	FONT_SUFFIX+="$(usev woff woff)"
	FONT_SUFFIX+="$(usev woff2 woff2)"
	FONT_SUFFIX+="$(usev eot eot)"
}

