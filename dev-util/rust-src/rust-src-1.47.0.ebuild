# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Source code of the rust programming language"
HOMEPAGE="https://rust-lang.org"

if [[ ${PV} = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/rust-lang/rust.git"
else
	SRC_URI="https://github.com/rust-lang/rust/archive/${PV}.tar.gz -> ${P}.tar.gz"
fi

RESTRICT="strip"

LICENSE="|| ( MIT Apache-2.0 ) BSD-1 BSD-2 BSD-4 UoI-NCSA"
SLOT="0"
IUSE=""
KEYWORDS="~amd64 ~arm64 ~x86"

DEPEND="=virtual/rust-${PV}"
RDEPEND="${DEPEND}"

S="${WORKDIR}/rust-${PV}"

src_configure() {
	return
}

src_compile() {
	return
}

src_install() {
	insinto /usr/src/rust/
	doins -r ./library
}

pkg_postinst() {
	einfo "You should set RUST_SRC_PATH to /usr/src/rust."
}
