# Copyright 2020-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit go-module

DESCRIPTION="impl generates method stubs for implementing an interface"
HOMEPAGE="https://github.com/josharian/impl"

inherit git-r3
EGIT_REPO_URI="https://github.com/josharian/impl.git"

RESTRICT="network-sandbox strip"
LICENSE="MIT"
SLOT="0"
IUSE=""

RDEPEND="dev-vcs/git"

src_unpack() {
	default

	rm -r ${S}/{testdata,*_test.go}
	# HACK: make this a module module
	go mod init github.com/josharian/${PN}

	git-r3_src_unpack
	go-module_live_vendor
}

src_compile() {
	go build -o ${PN}
}

src_install() {
	dobin ${PN}
}
