# Copyright 2020-2024 Robert Günzler
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit go

DESCRIPTION="plain text note-taking assistant"
HOMEPAGE="https://github.com/zk-org/zk"

inherit git-r3
EGIT_REPO_URI="https://github.com/zk-org/zk.git"

LICENSE="GPL-3"
SLOT="0"
IUSE="doc"
KEYWORDS="~amd64 ~arm64 ~x86"
RESTRICT="network-sandbox"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_compile() {
	emake build
}

src_install() {
	GOBIN=${ED}/usr/bin emake install

	dodoc ./README.md
	dodoc ./CHANGELOG.md
	if use doc; then
		dodoc -r ./docs
	fi
}
