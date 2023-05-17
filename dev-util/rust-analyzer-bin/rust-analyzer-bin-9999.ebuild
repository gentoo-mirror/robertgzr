# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="experimental Rust compiler frontend for IDEs"
HOMEPAGE="https://rust-analyzer.github.io/"

MY_SRC_URI="https://api.github.com/repos/rust-analyzer/rust-analyzer/releases/latest"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS=""
RESTRICT="strip mirror network-sandbox"

S="${WORKDIR}"

src_unpack() {
	bin_uri=$(wget -O- -q --header='Accept: application/json' "${MY_SRC_URI}" | grep 'browser' | cut -d\" -f4 | egrep -o '.*x86_64-unknown-linux-gnu.*')
	wget -O ./"${P}.gz" "${bin_uri}" || die
	unpack ./"${P}.gz"
}

src_install() {
	newbin ${P} rust-analyzer
}
