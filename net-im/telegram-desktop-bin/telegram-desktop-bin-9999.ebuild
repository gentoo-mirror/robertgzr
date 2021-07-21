# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit desktop optfeature xdg

DESCRIPTION="Official desktop client for Telegram (binary package)"
HOMEPAGE="https://desktop.telegram.org"

MY_SRC_URI="https://api.github.com/repos/telegramdesktop/tdesktop/releases"

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

BDEPEND="
	app-misc/jq
"

src_unpack() {
	tsetup_uri=$(wget -O- -q --header='Accept: application/json' "${MY_SRC_URI}" | jq -r '[ .. | select(.label?=="Linux 64 bit: Binary") ] | .[0] | .browser_download_url')
	tdesktop_uri=$(echo "${tsetup_uri}" | sed -e 's|tsetup\.|tdesktop-|' -e 's|\.tar\.xz|-full\.tar\.gz|')

	wget -O "./${P}-tsetup.tar.xz" "${tsetup_uri}" || die
	wget -O "./${P}-tdesktop.tar.gz" "${tdesktop_uri}" || die

	unpack "./${P}-tsetup.tar.xz"
	unpack "./${P}-tdesktop.tar.gz"
}

src_install() {
	exeinto /usr/lib/${PN}
	doexe "Telegram"
	newbin "${FILESDIR}"/${PN} "telegram-desktop"


	local unpacked_dir=$(ls -1 "${WORKDIR}" | grep tdesktop.*full)

	local icon_size
	for icon_size in 16 32 48 64 128 256 512; do
		newicon -s "${icon_size}" \
			"${WORKDIR}/${unpacked_dir}/Telegram/Resources/art/icon${icon_size}.png" \
			telegram.png
	done

	domenu "${WORKDIR}/${unpacked_dir}"/lib/xdg/telegramdesktop.desktop
}

pkg_postinst() {
	xdg_pkg_postinst
	optfeature "spell checker support" app-text/enchant
}
