# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

USE_MPV="rdepend"
MPV_REQ_USE="lua"
inherit mpv-plugin

DESCRIPTION="Feature-rich minimalist proximity-based UI for MPV player."
HOMEPAGE="https://github.com/tomasklaen/uosc"

if [[ $PV = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/tomasklaen/uosc"
else
	SRC_URI="https://github.com/tomasklaen/uosc/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"
fi


LICENSE="GPL-3"
KEYWORDS="~amd64"

src_prepare() {
	default

	mkdir ${PN}
	mv fonts ./${PN}/
	mv scripts/* ./${PN}/
	mv ./${PN}/${PN}.lua ./${PN}/main.lua
}

MPV_PLUGIN_FILES=( ${PN} )

src_install() {
	default
	mpv-plugin_src_install

	local MPV_INSTALL_DIR="/usr/$(get_libdir)/mpv"
	dosym -r "${MPV_INSTALL_DIR}/${PN}/fonts" "/etc/mpv/fonts"

	insinto "${MPV_INSTALL_DIR}/${PN}"
	doins -r script-opts
}
