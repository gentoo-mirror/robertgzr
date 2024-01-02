# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="embedded controller firmware util for framework laptop"
HOMEPAGE="https://github.com/FrameworkComputer/EmbeddedController"

inherit git-r3
EGIT_REPO_URI="${HOMEPAGE}.git"

LICENSE="BSD"
SLOT="0"
KEYWORDS=""

DEPEND="
	dev-embedded/libftdi
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_compile() {
	emake utils-host host-util-bin=ectool
}

src_install() {
	dobin ${S}/build/bds/util/ectool
}
