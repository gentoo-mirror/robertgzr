# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3 go-module

DESCRIPTION="official go language server"
HOMEPAGE="https://github.com/golang/tools/blob/master/gopls"

EGIT_REPO_URI="https://github.com/golang/tools.git"

RESTRICT="strip mirrors"
LICENSE="MIT"
SLOT="0"
IUSE=""
KEYWORDS="~amd64 ~arm64 ~x86"

S="${WORKDIR}/${P}/gopls"

src_unpack() {
	git-r3_src_unpack
	go-module_live_vendor
}

src_compile() {
	go build -v -ldflags "-s -w" -o "${PN}"
}

src_install() {
	dobin ${PN}
}
