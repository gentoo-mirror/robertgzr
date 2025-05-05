# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3 cargo

DESCRIPTION=""
HOMEPAGE="https://radicle.xyz"

MY_PV=1.1 # only used for reporting
EGIT_COMMIT=70f0cc35
EGIT_REPO_URI="https://seed.radicle.xyz/z3gqcJUoA1n9HaHKufZs5FCSGazv5.git"
RESTRICT=network-sandbox

LICENSE="MIT Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="systemd"

DEPEND="
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_unpack() {
	git-r3_src_unpack
	cargo_live_src_unpack
}

src_configure() {
    local myfeatures=(
        $(use systemd)
    )
    cargo_src_configure --no-default-features --bin rad
}

src_install() {
	cargo_src_install --path ./radicle-cli
}

pkg_postinst() {
	einfo
	einfo "This is radicle ${MY_PV}, built from ${EGIT_COMMIT}"
	einfo
}
