# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Conversion between markup formats"
HOMEPAGE="https://pandoc.org"
SRC_URI="https://github.com/jgm/pandoc/releases/download/${PV}/pandoc-${PV}-linux-amd64.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"

S="${WORKDIR}/pandoc-${PV}"

RESTRICT="strip"

src_install() {
	dobin bin/pandoc
	unpack share/man/man1/pandoc.1.gz
	doman pandoc.1
}
