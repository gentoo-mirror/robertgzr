# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit go-module

DESCRIPTION="programmable deployment system"
HOMEPAGE="https://dagger.io"

inherit git-r3
EGIT_REPO_URI="https://github.com/dagger/dagger.git"

RESTRICT="network-sandbox strip"
LICENSE="Apache-2.0"
SLOT="0"

src_unpack() {
	if [ -z "$EGIT_OVERRIDE_REPO_DAGGER_DAGGER" ]; then
		ewarn ""
		ewarn "NOTE: dagger is invite-only at the moment"
		ewarn "      clone the repo to your machine and then set"
		ewarn "      EGIT_OVERRIDE_REPO_DAGGER_DAGGER to proceed"
		ewarn ""
		exit 1
	fi

	default
	git-r3_src_unpack
	go-module_live_vendor
}

src_compile() {
	emake
}

src_install() {
	dobin ./cmd/dagger/${PN}
}
