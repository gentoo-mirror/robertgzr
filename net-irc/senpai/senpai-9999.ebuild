# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit go-module

DESCRIPTION="your everyday irc student"
HOMEPAGE="https://git.sr.ht/~taiite/senpai"

inherit git-r3
EGIT_REPO_URI="https://git.sr.ht/~taiite/senpai"

RESTRICT="network-sandbox"
LICENSE="MIT"
SLOT="0"
IUSE="+man"

DEPENDS="
	man? ( app-text/scdoc )
"

src_unpack() {
	default
	git-r3_src_unpack
	go-module_live_vendor
}

src_compile() {
	emake senpai

	if use man; then
		make doc/senpai.1 doc/senpai.5
	fi
}

src_install() {
	dobin ${PN}

	if use man; then
		doman doc/senpai.1
		doman doc/senpai.5
	fi
}
