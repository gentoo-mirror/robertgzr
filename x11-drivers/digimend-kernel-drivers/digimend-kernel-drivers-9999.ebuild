# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit linux-mod

DESCRIPTION="graphics tablet drivers for the linux kernel"
HOMEPAGE="https://github.com/DIGImend/digimend-kernel-drivers"

if [[ ${PV} = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/DIGImend/${PN}.git"
	KEYWORDS=""
else
	SRC_URI="https://github.com/DIGImend/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~arm64 ~x86"
fi

LICENSE="GPL-2"
SLOT="0"
IUSE="+kye +uclogic +polostar +viewsonic"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

BUILD_TARGETS="clean modules"
MODULE_NAMES=""

src_prepare() {
	default

	if use kye; then
		MODULE_NAMES+="hid-kye(kernel/drivers/input/tablet:${S}) "
	elif use uclogic; then
		MODULE_NAMES+="hid-uclogic(kernel/drivers/input/tablet:${S}) "
	elif use polostar; then
		MODULE_NAMES+="hid-polostar(kernel/drivers/input/tablet:${S}) "
	elif use viewsonic; then
		MODULE_NAMES+="hid-viewsonic(kernel/drivers/input/tablet:${S}) "
	fi
}
