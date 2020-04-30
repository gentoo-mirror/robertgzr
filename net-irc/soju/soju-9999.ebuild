# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3 go-module

DESCRIPTION="user-friendly IRC bouncer"
HOMEPAGE="https://sr.ht/~emersion/soju"

EGIT_REPO_URI="https://git.sr.ht/~emersion/soju"

LICENSE="AGPL-3"
SLOT="0"
IUSE=""

BDEPEND="app-text/scdoc"

src_unpack() {
	git-r3_src_unpack
	go-module_live_vendor
}

src_compile() {
	emake PREFIX="${EPREFIX}/usr"
}

src_install() {
	emake PREFIX="${EPREFIX}/usr" DESTDIR="${ED}" install
	einstalldocs
}
