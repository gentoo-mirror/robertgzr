# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9..12} )
inherit python-r1

DESCRIPTION="control framework laptop fan"
HOMEPAGE="https://github.com/TamtamHero/fw-fanctrl"

inherit git-r3
EGIT_REPO_URI="${HOMEPAGE}.git"

LICENSE="BSD"
SLOT="0"
KEYWORDS=""

DEPEND="
	${PYTHON_DEPS}
	sys-apps/lm-sensors
	>=dev-python/watchdog-2.1.9
	sys-apps/fw-ectool
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	newbin ${S}/fanctrl.py fanctrl

	insinto /etc/${PN}
	doins ${S}/config.json
}
