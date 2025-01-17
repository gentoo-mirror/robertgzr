# Copyright 2024 Robert Günzler
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cargo

DESCRIPTION="synchronize calendars and contacts"
HOMEPAGE="https://git.sr.ht/~whynothugo/pimsync"

if [[ ${PV} = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://git.sr.ht/~whynothugo/pimsync"
	# EGIT_REVISON="v2.0.0-alpha0"
	RESTRICT="network-sandbox"
else
	SRC_URI="https://git.sr.ht/~whynothugo/vdirsyncer-rs/archive/vdirsyncer/v${PV}.tar.gz -> ${P}.tar.gz
		$(cargo_crate_uris ${CRATES})"
	KEYWORDS="~amd64"
fi

LICENSE="EUPL-1.2"
SLOT="0"
IUSE="+man"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND="
	man? ( app-text/scdoc )
"

src_unpack() {
	if [[ ${PV} = *9999* ]]; then
		git-r3_src_unpack
		cargo_live_src_unpack
	else
		cargo_src_unpack
	fi
}

src_configure() {
	# local myfeatures=(
	# )
	cargo_src_configure
}

src_compile() {
	cargo_src_compile --package ${PN}
	use man && emake man
}

src_install() {
	cargo_src_install
	if use man; then
		doman ${S}/target/pimsync*.1
		doman ${S}/target/pimsync*.5
		doman ${S}/target/pimsync*.7
	fi
}
