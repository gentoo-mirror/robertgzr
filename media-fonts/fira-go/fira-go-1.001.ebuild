# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit font

MY_PV=$(ver_rs 1- '')
MY_PN="FiraGO"

DESCRIPTION="Default typeface for FirefoxOS, designed for legibility"
HOMEPAGE="https://bboxtype.com/typefaces/FiraGO"
SRC_URI="https://bboxtype.com/downloads/FiraGO/Download_Folder_FiraGO_${MY_PV}.zip"


LICENSE="OFL-1.1"
SLOT="0"
KEYWORDS="amd64 arm ~arm64 x86"
IUSE=""

DEPEND="
	app-arch/unzip
"

S="${WORKDIR}/Download_Folder_${MY_PN}_${MY_PV}"
FONT_S="
	${S}/Fonts/${MY_PN}_OTF_${MY_PV}/Italic/
	${S}/Fonts/${MY_PN}_OTF_${MY_PV}/Roman/
"
FONT_SUFFIX="otf"
