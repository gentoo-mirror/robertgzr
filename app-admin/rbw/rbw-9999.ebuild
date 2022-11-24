# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cargo

DESCRIPTION="unofficial bitwarden cli"
HOMEPAGE="https://git.tozt.net/rbw"

if [[ ${PV} = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://git.tozt.net/rbw"
else
	SRC_URI="https://git.tozt.net/rbw/snapshot/rbw-${PV}.tar.gz -> ${P}.tar.gz
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
BDEPEND="virtual/rust"

src_unpack() {
	if [[ ${PV} = *9999* ]]; then
		git-r3_src_unpack
		cargo_live_src_unpack
	else
		cargo_src_unpack
	fi
}
