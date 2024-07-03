# Copyright 2020-2024 Robert Günzler
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit go shell-completion

DESCRIPTION="simple cli for tracking working time"
HOMEPAGE="https://github.com/dominikbraun/timetrace"

inherit git-r3
EGIT_REPO_URI="https://github.com/dominikbraun/timetrace.git"

RESTRICT="network-sandbox strip"
LICENSE="MIT"
SLOT="0"
IUSE=""
KEYWORDS="~amd64 ~arm64 ~x86"

src_unpack() {
	default
	git-r3_src_unpack
	cd ${S} && sed -i -e 's/go 1.15/go 1.18/' ${S}/go.mod && go mod tidy
	go-module_live_vendor
}

src_install() {
	default
	go_src_install

	$D/usr/bin/timetrace completion bash | newbashcomp - "${PN}"
	$D/usr/bin/timetrace completion zsh | nezshcomp - "${PN}"
	$D/usr/bin/timetrace completion fish | newfishcomp - "${PN}"
}
