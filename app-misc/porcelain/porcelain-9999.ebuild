# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3 go-module

DESCRIPTION="git status parser"
HOMEPAGE="https://github.com/robertgzr/porcelain"

EGIT_REPO_URI="https://github.com/robertgzr/${PN}.git"

LICENSE="MIT"
SLOT="0"
IUSE=""
KEYWORDS="~amd64 ~arm64 ~x86"

DEPEND="dev-vcs/git"

src_unpack() {
	git-r3_src_unpack
	go-module_live_vendor
}

src_compile() {
	emake PREFIX="${EPREFIX}/usr" VERSION="${PV}"
}

src_install() {
	emake PREFIX="${EPREFIX}/usr" DESTDIR="${ED}" install
	einstalldocs
}
