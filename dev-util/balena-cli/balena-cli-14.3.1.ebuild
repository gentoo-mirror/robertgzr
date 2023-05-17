# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="The official balena CLI tool."
HOMEPAGE="https://github.com/balena-io/balena-cli"
SRC_URI="https://github.com/balena-io/${PN}/releases/download/v${PV}/${PN}-v${PV}-linux-x64-standalone.zip -> ${P}.zip"

RESTRICT="strip mirror"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}/${PN}"

BALENA_HOME=

src_install() {
	declare BALENA_HOME=/opt/${PN}

	# Install balena-cli in /opt
	dodir ${BALENA_HOME%/*}
	mv "${S}" "${ED}"${BALENA_HOME} || die

	# Create /usr/bin/balena-cli
	dodir /usr/bin/
	cat <<-EOF >"${ED}"/usr/bin/${PN}
	#!/bin/sh
	#unset LD_PRELOAD
	#LD_LIBRARY_PATH="/opt/${PN}/" \\
	exec /opt/${PN}/balena "\$@"
	EOF
	fperms 0755 /usr/bin/${PN}
}
