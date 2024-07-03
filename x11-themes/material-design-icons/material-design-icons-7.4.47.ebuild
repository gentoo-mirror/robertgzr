# Copyright 2020-2024 Robert Günzler
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit xdg

DESCRIPTION="5900+ Material Design Icons form the Community"
HOMEPAGE="https://materialdesignicons.com/"

SRC_URI="https://github.com/Templarian/MaterialDesign-SVG/archive/refs/tags/v${PV}.tar.gz -> ${PN}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 ppc64 x86"

S=${WORKDIR}/MaterialDesign-SVG-${PV}

src_install() {
	insinto /usr/share/icons/mdi/scalable
	doins -r "${S}"/svg/*
}
