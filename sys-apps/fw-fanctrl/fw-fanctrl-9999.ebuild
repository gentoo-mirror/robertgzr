# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9..12} )
inherit python-r1

DESCRIPTION="control framework laptop fan"
HOMEPAGE="https://github.com/TamtamHero/fw-fanctrl"

inherit git-r3
EGIT_REPO_URI="${HOMEPAGE}.git"

LICENSE="BSD-3-Clause"
SLOT="0"
KEYWORDS=""
IUSE="+ectool-prebuilt"

DEPEND="
	${PYTHON_DEPS}
	sys-apps/lm-sensors
	>=dev-python/watchdog-2.1.9
	!ectool-prebuilt? ( sys-apps/fw-ectool )
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	newbin ${S}/fanctrl.py fanctrl

	insinto /usr/share/${PN}
	doins ${S}/config.json

	# TODO: drop
	use ectool-prebuilt || dobin bin/ectool
}
