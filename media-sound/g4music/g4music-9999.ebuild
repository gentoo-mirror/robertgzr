# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit gnome2-utils meson vala

DESCRIPTION="beautiful, fast, fluent lightweight music player for GTK4"
HOMEPAGE="https://gitlab.gnome.org/neithern/g4music"

if [[ ${PV} = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="$HOMEPAGE"
else
	SRC_URI="https://gitlab.gnome.org/neithern/g4music/-/archive/v${PV}/g4music-v${PV}.tar.gz"
	KEYWORDS="~amd64"
	S="${WORKDIR}/${PN}-v${PV}"
fi

LICENSE="GPL-3"
SLOT="0"

DEPEND="
	gui-libs/gtk:4[wayland]
	gui-libs/libadwaita:1[vala]
	media-libs/gstreamer:1.0[introspection]
	media-libs/gst-plugins-base:1.0[introspection]
	media-libs/gst-plugins-bad:1.0[introspection]
"
RDEPEND="${DEPEND}"
BDEPEND="$(vala_depend)"

src_prepare() {
	default
	vala_setup
}

pkg_postinst() {
    xdg_pkg_postinst
    gnome2_schemas_update
}

pkg_postrm() {
    xdg_pkg_postrm
    gnome2_schemas_update
}
