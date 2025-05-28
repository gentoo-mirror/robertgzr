# Copyright 1999-2024 Robert Günzler
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..13} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1

DESCRIPTION="QR code encoder"
HOMEPAGE="https://segno.readthedocs.io/ https://github.com/heuer/segno"

if [[ "$PV" = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI=https://github.com/heuer/segno.git
else
	SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"
fi

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~riscv ~x86"

# RDEPEND="
# 	dev-python/humanize[${PYTHON_USEDEP}]
# "

DOCS=( CHANGES.rst README.rst )

distutils_enable_tests pytest

src_install() {
	distutils-r1_src_install

	doman man/segno.1
}
