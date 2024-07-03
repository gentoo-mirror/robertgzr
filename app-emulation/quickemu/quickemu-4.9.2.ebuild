# Copyright 2021-2024 Robert Günzler
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_10 )
inherit python-single-r1

DESCRIPTION="Create and run optimised Windows, macOS and Linux desktop virtual machines"
HOMEPAGE="https://github.com/quickemu-project/quickemu"
SRC_URI="https://github.com/quickemu-project/${PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="zsync tpm cdrom X"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

DEPEND="
	${PYTHON_DEPS}
	>=app-emulation/qemu-6.0.0[gtk,sdl,spice,smartcard,usbredir,virgl,virtfs]
	>=app-shells/bash-4.0:=
	cdrom? ( app-cdr/cdrtools )
	tpm? ( app-crypt/swtpm )
	app-misc/jq
	app-emulation/spice[smartcard]
	net-misc/spice-gtk[gtk3,smartcard,usbredir]
	net-misc/wget
	zsync? ( net-misc/zsync )
	sys-apps/usbutils
	sys-apps/util-linux
	|| (
		sys-firmware/edk2-ovmf
		sys-firmware/edk2-ovmf-bin
	)
	sys-process/procps
	X? ( x11-apps/xrandr )
	x11-misc/xdg-user-dirs
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	python_doscript macrecovery macrecovery
	dobin quickemu
	dobin quickget
}
