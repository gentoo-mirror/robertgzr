# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="lightweight terminal IRC client in C"
HOMEPAGE="http://rcr.io/rirc/"
SRC_URI="https://git.sr.ht/~rcr/rirc/archive/v0.1.3.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm64"

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
