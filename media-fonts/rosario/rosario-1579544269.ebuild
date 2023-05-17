# Copyright 2020-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit font

FONT_PN="Rosario"
DESCRIPTION="Classic semiserif typeface, ideal for magazines and academic journals"
HOMEPAGE="https://www.omnibus-type.com/fonts/rosario/"

SRC_URI="https://www.omnibus-type.com/wp-content/uploads/Rosario.zip?${PV} -> ${P}.zip"

LICENSE="OFL-1.1"
SLOT="0"
IUSE="ttf woff woff2 eot"
KEYWORDS="~amd64 ~arm ~arm64 ~ppc64 ~x86"

DEPEND="app-arch/unzip"

S="${WORKDIR}/${FONT_PN}"
FONT_S=("${S}/otf")
FONT_SUFFIX="otf"

src_prepare() {
	default

	if use ttf; then
		FONT_S+=("${S}/ttf")
		FONT_SUFFIX+=" ttf"
	elif use woff; then
		FONT_S+=("${S}/woff")
		FONT_SUFFIX+=" woff"
	elif use woff2; then
		FONT_S+=("${S}/woff2")
		FONT_SUFFIX+=" woff2"
	elif use eot; then
		FONT_S+=("${S}/eot")
		FONT_SUFFIX+=" eot"
	fi
}
