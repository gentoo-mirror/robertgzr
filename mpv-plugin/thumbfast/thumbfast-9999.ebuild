# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

USE_MPV="rdepend"
MPV_REQ_USE="lua"
inherit mpv-plugin

DESCRIPTION="High-performance on-the-fly thumbnailer"
HOMEPAGE="https://github.com/po5/thumbfast"

if [[ $PV = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/po5/thumbfast"
else
	SRC_URI="https://github.com/po5/thumbfast/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"
fi


LICENSE="GPL-3"
KEYWORDS="~amd64"

src_prepare() {
	default

	mkdir -p ${PN}/script-opts
	mv ./${PN}.conf ./${PN}/script-opts/
	mv ./${PN}.lua ./${PN}/main.lua
}

MPV_PLUGIN_FILES=( ${PN} )
