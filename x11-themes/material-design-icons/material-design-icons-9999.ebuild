# Copyright 2020-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit xdg git-r3

DESCRIPTION="5900+ Material Design Icons form the Community"
HOMEPAGE="https://materialdesignicons.com/"

EGIT_REPO_URI="https://github.com/Templarian/MaterialDesign-SVG.git"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS=""

src_install() {
	insinto /usr/share/icons/mdi/scalable
	doins -r "${S}"/svg/*
}
