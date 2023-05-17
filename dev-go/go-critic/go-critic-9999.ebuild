# Copyright 2020-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit go

DESCRIPTION="the most opinionated Go source code linter"
HOMEPAGE="https://github.com/go-critic/go-critic"

inherit git-r3
EGIT_REPO_URI="https://github.com/go-critic/go-critic.git"

RESTRICT="network-sandbox strip"
LICENSE="MIT"
SLOT="0"
IUSE=""

src_compile() {
	emake build-release GOCRITIC_VERSION="${PV}-$(git-r3_peek_remote_ref)"
}

src_install() {
	dobin bin/gocritic
}
