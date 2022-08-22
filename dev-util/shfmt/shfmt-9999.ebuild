# Copyright 2020-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit go

DESCRIPTION="shell script formatter"
HOMEPAGE="https://github.com/mvdan/sh"

inherit git-r3
EGIT_REPO_URI="https://github.com/mvdan/sh.git"

LICENSE="MIT"
SLOT="0"
IUSE="+man"
KEYWORDS="~amd64 ~arm64 ~x86"

BDEPEND="
	man? ( app-text/scdoc )
"

EGO_MAIN="${S}/cmd/${PN}"

src_compile() {
	go_src_compile

	use man && scdoc <./cmd/shfmt/shfmt.1.scd > shfmt.1
}

src_install() {
	go_src_install

	use man && doman shfmt.1
}
