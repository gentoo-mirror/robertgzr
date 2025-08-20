# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit meson

DESCRIPTION="notify-send alternative"
HOMEPAGE="https://codeberg.org/dnkl/fyi"
SRC_URI="https://codeberg.org/dnkl/fyi/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+man"

DEPEND="
	sys-apps/dbus
"
RDEPEND="${DEPEND}"
BDEPEND="
	man? ( app-text/scdoc )
"
IDEPEND="app-eselect/eselect-notify-send"
PDEPEND="virtual/notification-daemon"

S="${WORKDIR}/${PN}"

src_prepare() {
	default

	# patch docs dir to conform to FHS/Gentoo policy
	sed -ie "s/get_option('datadir'), 'doc', 'fyi')/get_option('datadir'), 'doc', '${P}')/" ${S}/meson.build
}

src_configure() {
	local emesonargs=(
		$(meson_feature man docs)
	)
	meson_src_configure
}
