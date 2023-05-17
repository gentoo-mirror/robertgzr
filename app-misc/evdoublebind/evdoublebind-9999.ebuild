# Copyright 2020-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Provides double key binds, via evdev"
HOMEPAGE="https://github.com/exrok/evdoublebind"

if [[ ${PV} = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/exrok/${PN}.git"
# else
	# TODO when there is a release...
	# SRC_URI="https://github.com/exrok/${PN}/releases/download/v${PV}/${P}.tar.gz -> ${P}.tar.gz"
	# KEYWORDS="~amd64 ~arm64 ~x86"
fi

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

BDEPEND="
	x11-libs/libxkbcommon
	sys-kernel/linux-headers
"

src_prepare() {
	eapply ${FILESDIR}/001-global-xkb-rules.patch
	eapply_user
}

src_install() {
	default

	# install xkb rule set
	dodir /usr/share/X11/xkb/rules
	cp /usr/share/X11/xkb/rules/evdev ${D}/usr/share/X11/xkb/rules/evdev-doublebind
	cp /usr/share/X11/xkb/rules/evdev.xml ${D}/usr/share/X11/xkb/rules/evdev-doublebind.xml
	cp /usr/share/X11/xkb/rules/evdev.lst ${D}/usr/share/X11/xkb/rules/evdev-doublebind.lst
	sed -i 's/!\s*option\s*=\s*symbols/! option	=	symbols\n  evdoublebind:mapping = +evdoublebind(mapping)/g' ${D}/usr/share/X11/xkb/rules/evdev-doublebind

	# install init script
	newinitd ${FILESDIR}/${PN}.initd ${PN}
	newconfd ${FILESDIR}/${PN}.confd ${PN}
}

pkg_postinst() {
	elog ""
	elog "See the author's blog post explaining the setup process:"
	elog "https://i64.dev/low-level-keyboards-hacks-easy-to-use/"
	elog ""
}
