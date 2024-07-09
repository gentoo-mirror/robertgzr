# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="manage files with git, without checking their contents into git"
HOMEPAGE="https://git-annex.branchable.com/"
MY_SRC_URI="https://downloads.kitenet.net/git-annex/linux/current/git-annex-standalone-amd64.tar.gz"

RESTRICT="network-sandbox strip"
LICENSE="AGPL-3"
SLOT="0"
KEYWORDS=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

S=${WORKDIR}/git-annex.linux

src_unpack() {
	local archive=${WORKDIR}/${P}.tar.gz

	wget -O "${archive}" "${MY_SRC_URI}" || die
	unpack "${archive}" || die
}

src_install() {
	dobin ${S}/shimmed/git-annex/git-annex
	dobin ${S}/shimmed/git-annex-shell/git-annex-shell
	dobin ${S}/shimmed/git-*annex/git-*annex

	doman ${S}/usr/share/man/man1/*
}

pkg_postinst() {
	echo
	ewarn "The binaries contained in this release are shipped as part of"
	ewarn "a fully standalone distribution of git-annex, as such they rely"
	ewarn "on a version of glibc shipped as part of that distribution."
	echo
	ewarn "If anything doesn't work it is probably due to that :P"
	echo
}
