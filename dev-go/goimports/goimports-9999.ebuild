# Copyright 2020-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3 go-module

DESCRIPTION="official go auto-importer"
HOMEPAGE="https://github.com/golang/tools/blob/master/cmd/goimports/doc.go"

EGIT_REPO_URI="https://github.com/golang/tools.git"

RESTRICT="network-sandbox"
LICENSE="MIT"
SLOT="0"
IUSE=""
KEYWORDS="~amd64 ~arm64 ~x86"

S="${WORKDIR}/${P}/cmd/goimports"

src_unpack() {
	default
	git-r3_src_unpack
	go-module_live_vendor
}

src_compile() {
	go build -v -ldflags "-s -w" -o "${PN}"
}

src_install() {
	dobin ${PN}
}
