# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( python3_{9..11} )

inherit distutils-r1

DESCRIPTION="Unofficial python lib to connect to GoPro via Wifi"
HOMEPAGE="https://github.com/konradit/gopro-py-api"

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/konradit/gopro-py-api.git"
else
	SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"
fi

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86 ~amd64-linux ~x86-linux"
IUSE="webcam"

DEPEND="
	webcam? ( dev-python/netifaces )
	${PYTHON_DEPS}"

RDEPEND="${DEPEND}"
