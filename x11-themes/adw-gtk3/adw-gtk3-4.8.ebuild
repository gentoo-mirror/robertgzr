# Copyright 1999-2024 Robert Günzler
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit xdg

DESCRIPTION="GTK3 port of libadwaita"
HOMEPAGE="https://github.com/lassekongo83/adw-gtk3"

MY_PV=$(ver_rs 1 '-')
SRC_URI="${HOMEPAGE}/releases/download/v${PV}/adw-gtk3v${MY_PV}.tar.xz"

LICENSE="LGPL-2.1+"
SLOT="0"
KEYWORDS="~alpha amd64 arm arm64 ~hppa ~ia64 ~loong ~mips ppc ppc64 ~riscv ~s390 sparc x86 ~amd64-linux ~x86-linux ~x64-solaris"

S=${WORKDIR}

src_install() {
	insinto /usr/share/themes
	doins -r "${PN}"
	doins -r "${PN}-dark"
}
