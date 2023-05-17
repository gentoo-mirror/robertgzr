# Copyright 2020-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit go

DESCRIPTION="linters runner for Go"
HOMEPAGE="https://github.com/golangci/golangci-lint"

inherit git-r3
EGIT_REPO_URI="https://github.com/golangci/golangci-lint.git"

RESTRICT="network-sandbox strip"
LICENSE="MIT"
SLOT="0"
IUSE=""
KEYWORDS=""

EGO_MAIN="./cmd/${PN}"

src_configure() {
	egoldflags=(
		-X main.version=${PV}
		-X main.commit=$(git-r3_peek_remote_ref)
		-X main.date=$(date -Iseconds)
	)
	go_src_configure
}
