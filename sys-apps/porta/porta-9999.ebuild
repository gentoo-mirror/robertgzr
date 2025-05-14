# Copyright 2024 Robert Günzler
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cargo

DESCRIPTION="xdg-desktop-portal client cli"
HOMEPAGE="https://git.sr.ht/~robertgzr/porta"

inherit git-r3
EGIT_REPO_URI="https://git.sr.ht/~robertgzr/porta"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE="+client +portal"

DEPEND="
	sys-apps/xdg-desktop-portal
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_unpack() {
	if [[ ${PV} = *9999* ]]; then
		git-r3_src_unpack
		cargo_live_src_unpack
	else
		cargo_src_unpack
	fi
}

src_install() {
	use client && cargo_src_install --path client
	use portal && cargo_src_install --path portal
}
