# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit meson

DESCRIPTION=""
HOMEPAGE="https://git.sr.ht/~robertgzr/pinentry-bemenu"

inherit git-r3
EGIT_REPO_URI="https://git.sr.ht/~robertgzr/pinentry-bemenu"
RESTRICT="network-sandbox"

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

src_prepare() {
	default

	meson subprojects download bemenu
}

pkg_postinst() {
	eselect pinentry update ifunset
}

pkg_postrm() {
	eselect pinentry update ifunset
}
