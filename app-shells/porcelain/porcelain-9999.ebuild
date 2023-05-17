# Copyright 2020-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit go-module

DESCRIPTION="git status parser"
HOMEPAGE="https://github.com/robertgzr/porcelain"

inherit git-r3
EGIT_REPO_URI="https://github.com/robertgzr/${PN}.git"

RESTRICT="network-sandbox"
LICENSE="MIT"
SLOT="0"
IUSE=""

src_unpack() {
	default
	git-r3_src_unpack
	go-module_live_vendor
}

src_compile() {
	emake VERSION="${PV}" REV="HEAD"
}

src_install() {
	emake DESTDIR="${ED}" PREFIX=/usr install
}
