# Copyright 2020-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit font

FONT_PN="Luciole"
DESCRIPTION=""
HOMEPAGE="https://www.luciole-vision.com/luciole-en.html"

SRC_URI="
http://www.typographies.fr/N/luciole/Luciole-Regular.ttf
http://www.typographies.fr/N/luciole/Luciole-Bold.ttf
http://www.typographies.fr/N/luciole/Luciole-Regular-Italic.ttf
http://www.typographies.fr/N/luciole/Luciole-Bold-Italic.ttf
"

LICENSE="CC-BY-4.0"
SLOT="0"
IUSE=""
KEYWORDS="~amd64 ~arm ~arm64 ~ppc64 ~x86"

FONT_S="${WORKDIR}/${P}"
FONT_SUFFIX="ttf"

src_unpack() {
	mkdir -p "${FONT_S}"
	for f in ${A}; do
		cp -Lv "${DISTDIR}/${f}" "${FONT_S}/"
	done
}
