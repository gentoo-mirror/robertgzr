# Copyright 2020-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3 go-module

DESCRIPTION="simple and flexible tool for managing secrets"
HOMEPAGE="https://github.com/mozilla/sops"

EGIT_REPO_URI="https://github.com/mozilla/sops.git"

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
	CGO_ENABLED=0 \
	go build -mod vendor -v -ldflags "-s -w" -o "${PN}" \
		go.mozilla.org/sops/v3/cmd/sops
}

src_install() {
	dobin ${PN}
}
