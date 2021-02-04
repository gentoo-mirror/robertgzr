# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="init scripts for gui-apps/kanshi"
HOMEPAGE="https://git.sr.ht/~robertgzr/portage/tree/sys-svc/kanshi"

LICENSE="MIT"
SLOT="0"

RDEPEND="gui-apps/kanshi"

src_install() {
	newinitd "${FILESDIR}"/kanshi.initd kanshi
	newconfd "${FILESDIR}"/kanshi.confd kanshi

	insinto /etc/logrotate.d
	newins "${FILESDIR}"/kanshi.logrotate kanshi
}

pkg_postinst() {
	elog "This init script uses the 'gui-enter' script from https://git.sr.ht/~robertgzr/dotfiles/tree/master/bin/"
}
