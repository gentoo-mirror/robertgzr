# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit meson

DESCRIPTION=""
HOMEPAGE=""

if [[ ${PV} = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://git.sr.ht/~sircmpwn/${PN}"
else
	exit 1
	# SRC_URI="https://git.sr.ht/~sircmpwn/${PN}/releases/download/v${PV}/${P}.tar.gz -> ${P}.tar.gz"
	# KEYWORDS="~amd64 ~arm64 ~x86"
fi

LICENSE="GPL-3"
SLOT="0"
IUSE=""

DEPEND="
	app-shells/mrsh
	sys-libs/libtickit
"
RDEPEND="${DEPEND}"
BDEPEND=""
