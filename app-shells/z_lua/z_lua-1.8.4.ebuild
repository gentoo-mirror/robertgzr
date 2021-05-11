# Copyright 2020-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

LUA_COMPAT=( lua5-{1..4} luajit )

inherit lua-single toolchain-funcs

DESCRIPTION="cd command that helps you navigate faster by learning your habits"
HOMEPAGE="https://github.com/skywind3000/z.lua"

MY_PN=${PN/_/.}
CZMOD_VER="1.0.0"

SRC_URI="https://github.com/skywind3000/${MY_PN}/archive/${PV}.tar.gz -> ${P}.tar.gz
	czmod? ( https://github.com/skywind3000/czmod/archive/${CZMOD_VER}.tar.gz -> czmod-${CZMOD_VER}.tar.gz )"

LICENSE="MIT"
SLOT="0"
IUSE="czmod"

REQUIRED_USE="${LUA_REQUIRED_USE}"
DEPEND="${LUA_DEPS}"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${MY_PN}-${PV}"

src_compile() {
	if use czmod; then
		pushd "${WORKDIR}/czmod-${CZMOD_VER}/"
		ebegin "$(tc-getCC) ${LDFLAGS} ${CFLAGS} -o czmod czmod.c system/imembase.c system/iposix.c -DIDISABLE_SHARED_LIBRARY=1"
		$(tc-getCC) ${LDFLAGS} ${CFLAGS} -o czmod czmod.c system/imembase.c system/iposix.c -DIDISABLE_SHARED_LIBRARY=1 || die
		eend $?
	fi
}

src_install() {
	insinto /usr/libexec/${PN}/
	doins "${S}"/*

	if use czmod; then
		pushd "${WORKDIR}/czmod-${CZMOD_VER}/"
		insinto /usr/libexec/${PN}/czmod
		dobin "${WORKDIR}/czmod-${CZMOD_VER}/czmod"
		doins czmod.bash czmod.zsh
	fi
}

pkg_postinst() {
	elog
	elog "To use z.lua, add the following to you bashrc:"
	elog " eval \"\$(lua /usr/libexec/${PN}/z.lua --init bash enhanced once fzf)\""
	elog "This will enable the enhanced algorithm with fzf-based tab completion"
	elog "for bash."
	elog
	if use czmod; then
	elog "To use the native module, add this *after* the line from above:"
	elog " source /usr/libexec/${PN}/czmod/czmod.bash"
	elog
	fi
	elog "Bash and Zsh support can be switche by using the equivalent"
	elog "argument / file extension."
}
