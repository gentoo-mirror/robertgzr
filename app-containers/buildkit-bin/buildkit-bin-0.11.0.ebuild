# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="buildkit"
HOMEPAGE="https://github.com/moby/buildkit"

SRC_URI="https://github.com/moby/buildkit/releases/download/v${PV}/buildkit-v${PV}.linux-amd64.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="strip"

S="${WORKDIR}"

src_install() {
	dobin bin/build{ctl,kitd}
	dobin bin/buildkit-qemu*

	newinitd "${FILESDIR}"/buildkitd.initd buildkitd
	newconfd "${FILESDIR}"/buildkitd.confd buildkitd

	insinto /etc/logrotate.d
	newins "${FILESDIR}"/buildkitd.logrotate buildkitd
}
