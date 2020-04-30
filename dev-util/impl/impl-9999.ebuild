# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3 go-module

DESCRIPTION="impl generates method stubs for implementing an interface"
HOMEPAGE="https://github.com/josharian/impl"

EGIT_REPO_URI="https://github.com/josharian/impl.git"

RESTRICT="strip mirrors"
LICENSE="MIT"
SLOT="0"
IUSE=""
KEYWORDS="~amd64 ~arm64 ~x86"

RDEPEND="dev-vcs/git"

src_unpack() {
	git-r3_src_unpack
	rm -r ${S}/{testdata,*_test.go}
	go mod init github.com/josharian/${PN}
	go-module_live_vendor
}

src_compile() {
	go build -v -ldflags "-s -w" -o ${PN}
}

src_install() {
	dobin ${PN}
}
