# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit meson

DESCRIPTION=""
HOMEPAGE="https://git.sr.ht/~robertgzr/pinentry-bemenu"

inherit git-r3
EGIT_REPO_URI="https://git.sr.ht/~robertgzr/pinentry-bemenu"

LICENSE="GPL-3"
SLOT="0"
# KEYWORDS=""

S="${WORKDIR}/bemenu-pinentry"

DEPEND="
	dev-libs/bemenu
	dev-libs/libassuan
	dev-libs/libgpg-error
"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${P}"

pkg_postinst() {
	eselect pinentry update ifunset
}

pkg_postrm() {
	eselect pinentry update ifunset
}
