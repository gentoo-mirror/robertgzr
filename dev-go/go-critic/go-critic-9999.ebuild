# Copyright 2020-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3 go-module

DESCRIPTION="the most opinionated Go source code linter"
HOMEPAGE="https://github.com/go-critic/go-critic"

EGIT_REPO_URI="https://github.com/go-critic/go-critic.git"

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
	emake build-release GOCRITIC_VERSION="${PV}-$(git-r3_peek_remote_ref)"
}

src_install() {
	dobin bin/gocritic
}
