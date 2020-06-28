# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit go-module

DESCRIPTION="yet another elegant go interpreter"
HOMEPAGE="https://github.com/containous/yaegi"

if [[ ${PV} = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/containous/${PN}.git"
else
	SRC_URI="https://github.com/containous/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz
		${EGO_SUM_SOURCE_URIS}"
fi

LICENSE="MIT"
SLOT="0"
IUSE=""
KEYWORDS="~amd64 ~arm64 ~x86"

# DEPEND=""
# RDEPEND="${DEPEND}"
# BDEPEND=""

src_unpack() {
	if [[ ${PV} = *9999* ]]; then
		git-r3_src_unpack
		go-module_live_vendor
	else
		default
	fi
}

src_compile() {
	# make generate
	go build -v -ldflags "-s -w" -o "${PN}" ./cmd/${PN}
}

src_test() {
	make tests
}

src_install() {
	dobin ./${PN}
}
