# Copyright 2020-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{9..11} )
inherit python-r1 python-utils-r1

DESCRIPTION="Sync Android notifications encrypted to a Linux desktop"
HOMEPAGE="https://github.com/rootkiwi/an2linuxserver"

inherit git-r3
EGIT_REPO_URI="https://github.com/rootkiwi/an2linuxserver.git"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS=""
IUSE="+bluetooth"
REQUIRED_USE=${PYTHON_REQUIRED_USE}

DEPEND="${PYTHON_DEPS}
	x11-libs/libnotify
	>=dev-libs/openssl-1.0.1
	dev-python/pygobject
	bluetooth? ( dev-python/pybluez )
"
RDEPEND="${DEPEND}"

src_install() {
	python_foreach_impl python_newscript ${PN}.py ${PN}
}
