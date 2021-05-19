# Copyright 2020-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

LUA_COMPAT=( lua5-{1..4} luajit  )
inherit lua ninja-utils

DESCRIPTION="lua language server written in lua"
HOMEPAGE="https://github.com/sumneko/lua-language-server"

inherit git-r3
EGIT_REPO_URI="https://github.com/sumneko/${PN}.git"

LICENSE="MIT"
SLOT="0"
IUSE=""
KEYWORDS="~amd64"
RESTRICT="strip"

PATCHES=(
	"${FILESDIR}/fix-build.patch"
)

src_compile() {
	ninja -C 3rd/luamake -f compile/ninja/linux.ninja
	./3rd/luamake/luamake rebuild
}

src_install() {
	insinto /usr/libexec/"${PN}"

	doins bin/Linux/*
	doins -r main.lua platform.lua debugger.lua \
		locale script meta

	sed "s:/usr/:${EPREFIX}&:" "${FILESDIR}"/wrapper | newbin - "${PN}"
}
