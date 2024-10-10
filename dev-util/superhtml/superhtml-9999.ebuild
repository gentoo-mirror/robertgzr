# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit zig

DESCRIPTION="HTML language server"
HOMEPAGE="https://github.com/kristoff-it/superhtml"

inherit git-r3
EGIT_REPO_URI="https://github.com/kristoff-it/superhtml"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""

DEPEND="
"
RDEPEND="${DEPEND}"
BDEPEND="
${ZIG_DEPS}
"

DOCS=( README.md )

QA_FLAGS_IGNORED="usr/bin/superhtml"

src_unpack() {
	if [[ ${PV} == 9999 ]]; then
		git-r3_src_unpack
		zig_live_src_unpack
	else
		default_src_unpack
	fi
}

src_configure() {
	local zig_args=(
		-Doptimize=ReleaseSafe
	)
	zig_src_configure
}
