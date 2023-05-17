# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="low-latency remote desktop"
HOMEPAGE="https://parsec.app"

MY_SRC_URI="https://builds.parsecgaming.com/package/parsec-linux.deb"
RESTRICT="network-sandbox"

LICENSE="all-rights-reserved"
SLOT="0"
KEYWORDS=""

# https://support.parsec.app/hc/en-us/articles/115003477771-Using-Parsec-With-other-Linux-Distros
DEPEND="
	x11-libs/libX11
	x11-libs/libXi
	media-libs/libglvnd
	x11-libs/libXcursor
	media-libs/alsa-lib
	virtual/udev
	dev-libs/openssl
"
RDEPEND="${DEPEND}"
BDEPEND=""

S=${WORKDIR}
QA_PREBUILT="usr/bin/* usr/share/skel/*.so"

src_unpack() {
	wget -O "${WORKDIR}"/"${P}".deb "${MY_SRC_URI}" || die
	A="${WORKDIR}"/"${P}".deb

	default
	unpack "${WORKDIR}"/data.tar.xz
}

src_install() {
	dobin usr/bin/${PN}d

	# insinto /usr/share/${PN}/
	# doins -r usr/share/${PN}/*

	# insinto /usr/share/applications
	# doins usr/share/applications/*.desktop
}
