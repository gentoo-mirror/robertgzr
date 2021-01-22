# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit go-module

DESCRIPTION="impl generates method stubs for implementing an interface"
HOMEPAGE="https://github.com/josharian/impl"

EGO_SUM=(
	"golang.org/x/tools 3fe2afc github.com/golang/tools"
)

go-module_set_globals

if [[ ${PV} = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/josharian/impl.git"
else
	SRC_URI="https://github.com/joasharian/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz
		${EGO_SUM_SRC_URI}"
	KEYWORDS="~amd64 ~arm64 ~x86"
fi

RESTRICT="strip"
LICENSE="MIT"
SLOT="0"
IUSE=""

RDEPEND="dev-vcs/git"

src_unpack() {
	default

	rm -r ${S}/{testdata,*_test.go}
	go mod init github.com/josharian/${PN}

	if [[ ${PV} = *9999* ]]; then
		git-r3_src_unpack
		go-module_live_vendor
	fi
}

src_compile() {
	go build -o ${PN}
}

src_install() {
	dobin ${PN}
}
