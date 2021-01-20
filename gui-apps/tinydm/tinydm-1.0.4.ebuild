# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="tiny display manager - wayland/x11 session starter for single user machines"
HOMEPAGE="https://gitlab.com/postmarketOS/tinydm"
SRC_URI="https://gitlab.com/postmarketOS/tinydm/-/archive/1.0.4/tinydm-1.0.4.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~aarch64 ~arm"

DEPEND="
	sys-apps/autologin
"
RDEPEND="${DEPEND}"

src_compile() {
	return
}
