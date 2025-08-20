# Copyright 2024 Robert Günzler
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit meson

DESCRIPTION=""
HOMEPAGE="https://git.sr.ht/~robertgzr/mkmenu"

inherit git-r3
EGIT_REPO_URI="https://git.sr.ht/~robertgzr/mkmenu"
RESTRICT="network-sandbox"
KEYWORDS=""

LICENSE="GPL-3"
SLOT="0"
IUSE="+pinentry examples test +zenity +symlink"

DEPEND="
	dev-libs/bemenu
	dev-libs/libscfg
	pinentry? (
		dev-libs/libassuan
		dev-libs/libgpg-error
	)
"
RDEPEND="${DEPEND}"

src_configure() {
	local emesonargs=(
		$(meson_use examples)
		$(meson_use pinentry)
		$(meson_use test)
		$(meson_use zenity)
		$(meson_use symlink)
	)
	meson_src_configure
}

pkg_postinst() {
	eselect pinentry update ifunset
}

pkg_postrm() {
	eselect pinentry update ifunset
}
