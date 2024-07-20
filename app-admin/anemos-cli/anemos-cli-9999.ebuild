# Copyright 2024 Robert Günzler
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION=""
HOMEPAGE="https://anemos.io"

inherit git-r3
EGIT_REPO_URI="https://git.sr.ht/~bitfehler/anemos-cli"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_compile() {
	:
}

src_install() {
	dobin anemos
	insinto /usr/share/${PN}
	doins anemos.conf
}
