# Copyright 2020-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit font

FONT_PN="Inter"
DESCRIPTION="A typeface carefully crafted & designed for computer screens"
HOMEPAGE="https://rsms.me/inter/"

SRC_URI="https://github.com/rsms/inter/releases/download/v${PV}/Inter-${PV}.zip -> ${P}.zip"

LICENSE="OFL-1.1"
SLOT="0"
IUSE="woff woff2"
KEYWORDS="~amd64 ~arm ~arm64 ~ppc64 ~x86"

DEPEND="app-arch/unzip"

S="${WORKDIR}"
FONT_S=("${S}/Inter Desktop")
FONT_SUFFIX="otf"

src_prepare() {
	default

	if use woff; then
		FONT_S+=("${S}/Inter Web")
		FONT_SUFFIX+=" woff"
	elif use woff2; then
		FONT_S+=("${S}/Inter Web")
		FONT_SUFFIX+=" woff2"
	fi
}
