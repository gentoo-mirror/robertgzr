# Copyright 2020-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3 go-module

DESCRIPTION="a stricter gofmt"
HOMEPAGE="https://github.com/mvdan/gofumpt"

EGIT_REPO_URI="https://github.com/mvdan/gofumpt.git"

RESTRICT="network-sandbox strip"
LICENSE="MIT"
SLOT="0"
IUSE=""
KEYWORDS="~amd64 ~arm64 ~x86"

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
