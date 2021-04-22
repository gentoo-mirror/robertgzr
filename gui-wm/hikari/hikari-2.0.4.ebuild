# Copyright 2020-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="stacking wayland compositor with tiling capabilities"
HOMEPAGE="https://hub.darcs.net/raichoo/hikari"
SRC_URI="https://hub.darcs.net/raichoo/${PN}/dist -> ${P}.zip"

LICENSE="MIT"
SLOT="0"
IUSE="elogind systemd X +screencopy +gamma +layershell man"
KEYWORDS="~amd64"

DEPEND="
	>=dev-libs/libinput-1.6.0:0=
	dev-libs/glib
	dev-libs/libpcre
	dev-libs/libucl
	dev-libs/wayland
	x11-libs/cairo
	x11-libs/libxkbcommon
	x11-libs/pango
	x11-libs/pixman
	>=gui-libs/wlroots-0.10.0:=[elogind=,systemd=,X=]
"
# DEPEND+="
# 	>=gui-libs/wlroots-0.10.0:=[elogind=,systemd=,X=]
# 	<gui-libs/wlroots-0.11.0:=[elogind=,systemd=,X=]
# "
BDEPEND="
	>=dev-libs/wayland-protocols-1.14
	virtual/pkgconfig
	sys-devel/bmake
"

S="${WORKDIR}/${PN}"

src_compile() {
	MAKE="bmake" \
	emake \
		WITH_POSIX_C_SOURCE=YES \
		WITH_XWAYLAND=$(usex X YES NO) \
		WITH_SCREENCOPY=$(usex screencopy YES NO) \
		WITH_GAMMACONTROL=$(usex gamma YES NO) \
		WITH_LAYERSHELL=$(usex layershell YES NO) \
		${EXTRA_EMAKE}
}

src_install() {
	use man || touch "${S}/share/man/man1/hikari.1"

	MAKE="bmake" \
	emake \
		DESTDIR="${D}" \
		PREFIX="${EPREFIX}"/usr \
		ETC_PREFIX="${EPREFIX}" \
		${EXTRA_EMAKE} \
		install

	use man || rm "${ED}"/usr/share/man/man1/hikari.1

	insinto "/usr/share/wayland-sessions/"
	insopts -m644
	doins "${FILESDIR}"/hikari.desktop
}
