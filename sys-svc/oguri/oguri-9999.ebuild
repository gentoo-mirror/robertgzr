# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="init scripts for gui-apps/oguri"
HOMEPAGE="https://git.sr.ht/~robertgzr/portage/tree/sys-svc/oguri"

LICENSE="MIT"
SLOT="0"

RDEPEND="gui-apps/oguri"

src_install() {
	newinitd "${FILESDIR}"/oguri.initd oguri
	newconfd "${FILESDIR}"/oguri.confd oguri
}

pkg_postinst() {
	elog "This init script uses the 'gui-enter' script from https://git.sr.ht/~robertgzr/dotfiles/tree/master/bin/"
}
