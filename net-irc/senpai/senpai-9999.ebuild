# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit go

DESCRIPTION="your everyday irc student"
HOMEPAGE="https://git.sr.ht/~taiite/senpai"

inherit git-r3
EGIT_REPO_URI="https://git.sr.ht/~taiite/senpai"

LICENSE="MIT"
SLOT="0"
IUSE="+man"

DEPENDS="
	man? ( app-text/scdoc )
"

src_compile() {
	default

	if use man; then
		make doc/senpai.1 doc/senpai.5
	fi
}

src_install() {
	emake install PREFIX=/usr DESTDIR="${ED}"

	if use man; then
		doman doc/senpai.1
		doman doc/senpai.5
	fi
}
