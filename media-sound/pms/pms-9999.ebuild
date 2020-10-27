# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit go-module

DESCRIPTION="Practical Music Search is an interactive Vim-like console client for MPD"
HOMEPAGE="https://ambientsound.github.io/pms/"

# EGO_SUM=()

go-module_set_globals

if [[ ${PV} = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/ambientsound/${PN}.git"
else
	SRC_URI="https://github.com/ambientsound/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz
		${EGO_SUM_SRC_URI}"
	KEYWORDS="~amd64 ~arm64 ~x86"
fi

LICENSE="MIT"
SLOT="0"
IUSE=""

src_unpack() {
	default

	if [[ ${PV} = *9999* ]]; then
		git-r3_src_unpack
		go-module_live_vendor
	fi
}

src_compile() {
	go build -ldflags "main.buildVersion=${PV}" -o ${WORKDIR}/pms .
}

src_install() {
	dobin ${WORKDIR}/pms
}
