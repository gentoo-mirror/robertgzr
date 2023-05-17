# Copyright 2020-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="downloads extensions from the chrome webstore and unpacks them"
HOMEPAGE="https://github.com/gcarq/inoxunpack"

inherit git-r3
EGIT_REPO_URI="https://github.com/gcarq/${PN}.git"

LICENSE="GPL-3"
SLOT="0"
IUSE=""
KEYWORDS="~amd64 ~arm64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	newbin inoxunpack.py inoxunpack
}
