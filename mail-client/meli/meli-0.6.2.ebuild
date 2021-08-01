# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="terminal mail client"
HOMEPAGE="https://meli.delivery"

MY_PV="alpha-${PV}"
SRC_URI="https://git.meli.delivery/meli/meli/archive/${MY_PV}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
RESTRICT="network-sandbox"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND="
	>=virtual/rust-1.39.0
	dbus-notifications? ( sys-apps/dbus )
"

S="${WORKDIR}/${PN}"

IUSE="+dbus-notifications +regexp +smtp +sqlite3 notmuch jmap svgscreenshot"

src_compile() {
	cargo_features=(
		$(usev dbus-notifications)
		$(usev regexp)
		$(usev smtp)
		$(usev sqlite3)
		$(usev notmuch)
		$(usev jmap)
		$(usev svgscreenshot)
	)
	emake meli FEATURES=--features=$(echo ${cargo_features[@]} | sed 's/ /,/g')
}

src_install() {
	dobin target/release/meli
	doman docs/meli.1
	doman docs/meli.conf.5
	doman docs/meli-themes.5
}
