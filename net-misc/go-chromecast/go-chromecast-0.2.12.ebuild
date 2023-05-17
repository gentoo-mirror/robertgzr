# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit go-module

DESCRIPTION="CLI for Google chromecast"
HOMEPAGE="https://github.com/vishen/go-chromecast"
SRC_URI="https://github.com/vishen/go-chromecast/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm64 ~ppc64 ~riscv"
RESTRICT="network-sandbox"

S="${WORKDIR}/go-chromecast-${PV}"

src_compile() {
	ego build -o go-chromecast . || die
}

src_install() {
	dobin go-chromecast
}
