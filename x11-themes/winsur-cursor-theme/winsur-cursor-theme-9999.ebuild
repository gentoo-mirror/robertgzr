# Copyright 2020-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit xdg

DESCRIPTION="A combination of MacOS BigSur and Windows 10 cursors"
HOMEPAGE="https://github.com/yeyushengfan258/WinSur-dark-cursors"

MY_SRC_URI="https://github.com/yeyushengfan258/WinSur-dark-cursors/archive/master.tar.gz"
RESTRICT="strip mirror network-sandbox"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

S="${WORKDIR}/WinSur-dark-cursors-master"

src_unpack() {
	wget -O ./"${P}.tar.gz" "${MY_SRC_URI}" || die
	unpack ./"${P}.tar.gz"
}

src_install() {
	# change the name
	sed -e 's/Name=WinSur Dark Cursors/Name=WinSur/' -i "${S}"/dist/index.theme

	insinto /usr/share/icons/WinSur
	doins -r "${S}"/dist/*
}
