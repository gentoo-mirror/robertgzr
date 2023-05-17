# Copyright 2020-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit go

DESCRIPTION="official go auto-importer"
HOMEPAGE="https://github.com/golang/tools/blob/master/cmd/goimports/doc.go"

inherit git-r3
EGIT_REPO_URI="https://github.com/golang/tools.git"

RESTRICT="network-sandbox"
LICENSE="MIT"
SLOT="0"
IUSE=""
KEYWORDS="~amd64 ~arm64 ~x86"

EGO_MAIN="./cmd/goimports"
