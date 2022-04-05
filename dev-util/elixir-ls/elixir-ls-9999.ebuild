# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION=""
HOMEPAGE=""

if [[ ${PV} = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/elixir-lsp/elixir-ls.git"
else
	SRC_URI="https://github.com/elixir-lsp/elixir-ls/archive/refs/tags/${PV}.tar.gz"
	KEYWORDS="~amd64"
fi

LICENSE="Apache-2"
SLOT="0"

RESTRICT="network-sandbox"

DEPEND="
	>=dev-lang/elixir-1.10
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_compile() {
	export HEX_HOME="${WORKDIR}"/.hex
	mix local.hex --force || die
	mix local.rebar --force || die
	mix deps.get --force || die
	mix elixir_ls.release -o "${WORKDIR}"/_release --force || die
}

src_install() {
	insinto /usr/libexec/"${PN}"
	doins "${WORKDIR}"/_release/*

	# create langserver launcher
	dodir /usr/bin/
	cat <<-EOF >"${ED}"/usr/bin/${PN}
	#!/bin/sh
	export ELS_MODE="language_server"
	export ELS_SCRIPT="ElixirLS.LanguageServer.CLI.main()"
	export ERL_LIBS="/usr/libexec/${PN}:\$ERL_LIBS"
	exec elixir --erl "+sbwt none +sbwtdcpu none +sbwtdio none"  -e "\$ELS_SCRIPT"
	EOF
	fperms 0755 /usr/bin/${PN}

	# create debugger launcher
	cat <<-EOF >"${ED}"/usr/bin/${PN}-debugger
	#!/bin/sh
	export ELS_MODE="debugger"
	export ELS_SCRIPT="ElixirLS.Debugger.CLI.main()"
	export ERL_LIBS="/usr/libexec/${PN}:\$ERL_LIBS"
	exec elixir --erl "+sbwt none +sbwtdcpu none +sbwtdio none"  -e "\$ELS_SCRIPT"
	EOF
	fperms 0755 /usr/bin/${PN}-debugger
}
