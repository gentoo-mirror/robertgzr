# Copyright 2020-2024 Robert Günzler
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit font

DESCRIPTION=""
HOMEPAGE="https://materialdesignicons.com/"

SRC_URI="https://github.com/Templarian/MaterialDesign-Webfont/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 ppc64 x86"

S=${WORKDIR}/MaterialDesign-Webfont-${PV}

FONT_S=${S}/fonts
FONT_SUFFIX="ttf"
