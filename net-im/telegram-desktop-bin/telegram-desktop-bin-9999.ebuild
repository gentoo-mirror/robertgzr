# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit desktop optfeature xdg

DESCRIPTION="Official desktop client for Telegram (binary package)"
HOMEPAGE="https://desktop.telegram.org"

RESTRICT="network-sandbox"
LICENSE="GPL-3-with-openssl-exception"
SLOT="0"

QA_PREBUILT="usr/lib/${PN}/Telegram"

RDEPEND="
	dev-libs/glib:2
	dev-libs/gobject-introspection
	>=media-libs/fontconfig-2.13
	media-libs/freetype:2
	media-libs/libglvnd[X]
	>=sys-apps/dbus-1.4.2[X]
	sys-libs/zlib
	x11-libs/libSM
	x11-libs/libdrm
	x11-libs/libICE
	x11-libs/libSM
	x11-libs/libX11
	>=x11-libs/libxcb-1.10[xkb]
"

S="${WORKDIR}/Telegram"

src_unpack() {
	MY_PV=$(wget -O- -q "https://github.com/telegramdesktop/tdesktop/releases/latest" | grep -o 'href="/telegramdesktop/tdesktop/releases/tag/.*">' | rev | cut -d\/ -f1 | rev | cut -d\" -f1 | tr -d 'v')
	elog "Unpacking ${MY_PV}"
	wget -O ./tdesktop-9999.tar.gz "https://github.com/telegramdesktop/tdesktop/releases/download/v${MY_PV}/tdesktop-${MY_PV}-full.tar.gz"
	unpack ./tdesktop-9999.tar.gz
	wget -O ./tsetup-9999.tar.xz "https://github.com/telegramdesktop/tdesktop/releases/download/v${MY_PV}/tsetup.${MY_PV}.tar.xz"
	unpack ./tsetup-9999.tar.xz
}

src_install() {
	exeinto /usr/lib/${PN}
	doexe "Telegram"
	newbin "${FILESDIR}"/${PN} "telegram-desktop"

	local icon_size
	for icon_size in 16 32 48 64 128 256 512; do
		newicon -s "${icon_size}" \
			"${WORKDIR}/tdesktop-${MY_PV}-full/Telegram/Resources/art/icon${icon_size}.png" \
			telegram.png
	done

	domenu "${WORKDIR}/tdesktop-${MY_PV}-full"/lib/xdg/telegramdesktop.desktop
}

pkg_postinst() {
	xdg_pkg_postinst
	optfeature "spell checker support" app-text/enchant
}
