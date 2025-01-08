# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

ZIG_SLOT=0.13
inherit zig

DESCRIPTION="HTML language server"
HOMEPAGE="https://github.com/kristoff-it/superhtml"

inherit git-r3
EGIT_REPO_URI="https://github.com/kristoff-it/superhtml"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""

DOCS=( README.md )

src_unpack() {
	if [[ ${PV} == 9999 ]]; then
		git-r3_src_unpack
		zig_live_fetch
	else
		default_src_unpack
	fi
}

src_configure() {
	local my_zbs_args=(
		-Dforce-version=${PV}
	)

	zig_src_configure
}

src_test() {
	zig_src_compile test
}
