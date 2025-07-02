# Copyright 2021-2024 Robert Günzler
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cargo shell-completion

DESCRIPTION="unofficial bitwarden cli"
HOMEPAGE="https://git.tozt.net/rbw"

if [[ ${PV} = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://git.tozt.net/rbw"
	RESTRICT="network-sandbox"
else
	SRC_URI="https://git.tozt.net/rbw/snapshot/rbw-${PV}.tar.gz -> ${P}.tar.gz
		$(cargo_crate_uris ${CRATES})"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="MIT"
SLOT="0"

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

src_install() {
	cargo_src_install

	$D/usr/bin/rbw gen-completions bash | newbashcomp - "$PN"
	$D/usr/bin/rbw gen-completions zsh | newzshcomp - "$PN"
	$D/usr/bin/rbw gen-completions fish | newfishcomp - "$PN"
}
