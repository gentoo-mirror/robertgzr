# Copyright 2020-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3 go-module

DESCRIPTION="linters runner for Go"
HOMEPAGE="https://github.com/golangci/golangci-lint"

EGIT_REPO_URI="https://github.com/golangci/golangci-lint.git"

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
	go build -o ./${PN} -ldflags="-w -s -X main.version=${PV} -X main.commit=$(git-r3_peek_remote_ref) -X main.date=$(date -Iseconds)" ./cmd/${PN}
}

src_install() {
	dobin ./${PN}
}
