# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION=""
HOMEPAGE="https://gitlab.alpinelinux.org/alpine/apk-tools"
SRC_URI="https://gitlab.alpinelinux.org/alpine/apk-tools/-/archive/v${PV}/apk-tools-v${PV}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="man"

DEPEND="
	man? ( virtual/lua )
"
RDEPEND="${DEPEND}"
BDEPEND=""

S=${WORKDIR}/${PN}-v${PV}

src_configure() {
	printf "export TEST = n\n" >> ${S}/config.mk
	printf "export STATIC = n\n" >> ${S}/config.mk
	use man || printf "export LUA = no\n" >> ${S}/config.mk
}

src_install() {
	default

	# cleanup static library
	# it doesn't look like the STATIC=n switch helps with this
	rm -v ${D}/lib/libapk.a

	# can't seem to configure the LIBDIR via config.mk
	mkdir ${D}/lib64
	mv -v ${D}/lib/libapk* ${D}/lib64/
}
