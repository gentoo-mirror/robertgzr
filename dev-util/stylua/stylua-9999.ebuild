# Copyright 2024 Robert Günzler
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cargo

DESCRIPTION="opinionated lua code formatter"
HOMEPAGE="https://github.com/JohnnyMorganz/StyLua"

if [[ ${PV} = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/JohnnyMorganz/StyLua.git"
else
	SRC_URI="https://github.com/JohnnyMorganz/StyLua/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
		$(cargo_crate_uris ${CRATES})"
	KEYWORDS="~amd64"
fi

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
RESTRICT="network-sandbox"
#IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_unpack() {
	if [[ ${PV} = *9999* ]]; then
		git-r3_src_unpack
		cargo_live_src_unpack
	else
		cargo_src_unpack
	fi
}

src_configure() {
	local myfeatures=(
		lua52
		lua53
		lua54
		luau
	)
	cargo_src_configure
}
