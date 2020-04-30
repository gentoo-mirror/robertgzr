# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit go-module

DESCRIPTION="impl generates method stubs for implementing an interface"
HOMEPAGE="https://github.com/josharian/impl"

EGO_PN="github.com/josharian/${PN}"
EGO_COMMIT="6b9658ad00c7fbd61a7b50c195754413f6c4142c"
EGO_VENDOR=(
	"golang.org/x/tools 3fe2afc github.com/golang/tools"
)

MY_P="${PN}-${EGO_COMMIT}"
SRC_URI="https://${EGO_PN}/archive/${EGO_COMMIT}.tar.gz -> ${MY_P}.tar.gz
	$(go-module_vendor_uris)"

RESTRICT="strip mirrors"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"

S="${WORKDIR}/${MY_P}"
RDEPEND="dev-vcs/git"

src_prepare() {
	default

	go mod init "${EGO_PN}"
}

src_compile() {
	go build -v -ldflags "-s -w"
}

src_install() {
	dobin impl
}
