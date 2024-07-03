# Copyright 2021-2024 Robert Günzler
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit meson pam

DESCRIPTION="daemon for automatic login on TTY"
HOMEPAGE="https://git.sr.ht/~kennylevinsen/autologin"
SRC_URI="https://git.sr.ht/~kennylevinsen/autologin/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~aarch64 ~arm"

DEPEND="
	sys-libs/pam
"
RDEPEND="${DEPEND}"

src_install() {
	meson_src_install
	newpamd ${FILESDIR}/autologin.pamd autologin
}
