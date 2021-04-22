# Copyright 2020-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="A wrapper to use wl-clipboard as a drop-in replacement to X11 clipboard tools"
HOMEPAGE="https://github.com/brunelli/wl-clipboard-x11"

if [[ ${PV} = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/brunelli/${PN}.git"
else
	SRC_URI="https://github.com/brunelli/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~arm64 ~x86"
fi

RESTRICT="mirrors"

LICENSE="MIT"
SLOT="0"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
