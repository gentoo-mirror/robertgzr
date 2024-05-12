# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Build system images from declarative input"
HOMEPAGE="https://sr.ht/~bitfehler/makeimg"

if [[ ${PV} = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://git.sr.ht/~bitfehler/makeimg"
else
	SRC_URI="https://git.sr.ht/~bitfehler/makeimg/archive/v${PV}.tar.gz"
	KEYWORDS="~amd64"
fi

LICENSE="MIT"
SLOT="0"
IUSE="+man"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND="
	man? ( app-text/scdoc )
"

src_compile() {
	if use man; then
		emake man
		gzip -d doc/makeimg.1.gz doc/IMGBUILD.5.gz
	fi
}

src_install() {
	dobin makeimg
	use man && doman doc/makeimg.1 doc/IMGBUILD.5
	dodoc README.md LICENSE
}
