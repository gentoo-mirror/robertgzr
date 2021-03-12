# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit font git-r3

FONT_PN="MaterialDesignIcons"
DESCRIPTION=""
HOMEPAGE="https://materialdesignicons.com/"

EGIT_REPO_URI="https://github.com/Templarian/MaterialDesign-Font.git"

LICENSE="OFL-1.1"
SLOT="0"
IUSE=""
KEYWORDS="~amd64 ~arm ~arm64 ~ppc64 ~x86"

# FONT_S="${WORKDIR}/${P}"
FONT_SUFFIX="ttf"

# src_unpack() {
# 	mkdir -p "${FONT_S}"
# 	for f in ${A}; do
# 		cp -Lv "${DISTDIR}/${f}" "${FONT_S}/"
# 	done
# }
