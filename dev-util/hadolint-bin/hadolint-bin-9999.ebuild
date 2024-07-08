# Copyright 2024 Robert Günzler
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="experimental Rust compiler frontend for IDEs"
HOMEPAGE="https://rust-analyzer.github.io/"

MY_SRC_URI="https://api.github.com/repos/hadolint/hadolint/releases/latest"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
RESTRICT="strip mirror network-sandbox"

S="${WORKDIR}"

src_unpack() {
	bin_uri=$(wget -O- -q --header='Accept: application/json' "${MY_SRC_URI}" | grep 'browser' | cut -d\" -f4 | egrep -o '.*-Linux-x86_64' | head -n1)
	wget "${bin_uri}" || die
	hash_uri=$(wget -O- -q --header='Accept: application/json' "${MY_SRC_URI}" | grep 'browser' | cut -d\" -f4 | egrep -o '.*-Linux-x86_64.sha256' | head -n1)
	wget "${hash_uri}" || die
	sha256sum -c hadolint-Linux-x86_64.sha256 || die
}

src_install() {
	newbin hadolint-Linux-x86_64 hadolint
}
