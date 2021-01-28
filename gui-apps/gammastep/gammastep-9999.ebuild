# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6
PYTHON_COMPAT=( python3_{6,7} )

inherit systemd autotools eutils gnome2-utils python-r1

DESCRIPTION="A screen color temperature adjusting software"
HOMEPAGE="http://jonls.dk/redshift/"

inherit git-r3
EGIT_REPO_URI="https://gitlab.com/chinstrap/gammastep.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE="ayatana drm geoclue indicator nls apparmor randr vidmode wayland"

COMMON_DEPEND=">=x11-libs/libX11-1.4
	x11-libs/libXxf86vm
	x11-libs/libxcb
	x11-libs/libdrm
	ayatana? ( dev-libs/libappindicator:3[introspection] )
	geoclue? ( app-misc/geoclue:2.0 dev-libs/glib:2 )
	indicator? ( ${PYTHON_DEPS} )"
RDEPEND="${COMMON_DEPEND}
	indicator? ( dev-python/pygobject[${PYTHON_USEDEP}]
		x11-libs/gtk+:3[introspection]
		dev-python/pyxdg[${PYTHON_USEDEP}] )"
DEPEND="${COMMON_DEPEND}
	>=dev-util/intltool-0.50
	nls? ( sys-devel/gettext )
"
REQUIRED_USE="indicator? ( ${PYTHON_REQUIRED_USE} )"

src_prepare() {
	default
	eautoreconf
}

src_configure() {
	use indicator && python_setup

	local myeconfargs=(
		--disable-silent-rules
		$(use_enable nls)
		$(use_enable drm)
		$(use_enable wayland)
		$(use_enable randr)
		$(use_enable vidmode)
		$(use_enable geoclue geoclue2)
		$(use_enable indicator gui)
		$(use_enable apparmor)
		--with-systemduserunitdir="$(systemd_get_userunitdir)"
	)

	econf "${myeconfargs[@]}"
}

_impl_specific_src_install() {
	emake DESTDIR="${D}" pythondir="$(python_get_sitedir)" \
			-C src/${PN}-indicator install
}

src_install() {
	emake DESTDIR="${D}" UPDATE_ICON_CACHE=/bin/true install

	if use indicator; then
		python_foreach_impl _impl_specific_src_install
		python_replicate_script "${D}"/usr/bin/${PN}-indicator
		dosym ${PN}-indicator /usr/bin/${PN}-indicator

		python_foreach_impl python_optimize
	fi
}

pkg_preinst() {
	use indicator && gnome2_icon_savelist
}

pkg_postinst() {
	use indicator && gnome2_icon_cache_update
}

pkg_postrm() {
	use indicator && gnome2_icon_cache_update
}
