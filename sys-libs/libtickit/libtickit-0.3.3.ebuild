# Copyright 2020-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Library for building interactive full-screen terminal programs"
HOMEPAGE="http://www.leonerd.org.uk/code/libtickit"

if [[ ${PV} = *9999* ]]; then
	# TODO uses bazaar
	# http://bazaar.leonerd.org.uk/c/libtickit
	exit 1
else
	SRC_URI="http://www.leonerd.org.uk/code/${PN}/${PN}-${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
fi

LICENSE="MIT"
SLOT="0"
IUSE=""

DEPEND="
	dev-libs/libtermkey
	>=dev-libs/unibilium-1.1.0
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	emake \
		DESTDIR="${D}" \
		PREFIX=/usr \
		LIBDIR=/usr/lib64 \
		install-inc install-lib

	doman "${S}"/man/*.3
	doman "${S}"/man/*.7

	libtool --finish "${D}"/usr/lib64
}
