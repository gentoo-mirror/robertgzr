# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="lightweight terminal IRC client in C"
HOMEPAGE="http://rcr.io/rirc/"

inherit git-r3
# EGIT_SUBMODULES=()
EGIT_REPO_URI="https://git.sr.ht/~rcr/rirc"

LICENSE="MIT"
SLOT="0"

DEPEND="
	net-libs/mbedtls
	dev-util/gperf
"
RDEPEND="${DEPEND}"
BDEPEND="
	dev-lang/perl
"

src_compile() {
	# emake rirc TLS_LIBS= LD_EXT='-lmbedtls -lmbedx509 -lmbedcrypto'
	emake rirc
}

src_install() {
	emake install TLS_LIBS= BIN_DIR=${ED}/usr/bin MAN_DIR=${ED}/usr/share/man/man1
}
