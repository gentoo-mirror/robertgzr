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

RESTRICT="network-sandbox strip"
DEPENDS="dev-lang/go"
src_compile() {
	go build -ldflags "-s -w" -o src/${PN}/bin/ziggy-linux ./src/ziggy/ziggy.go
}

MPV_PLUGIN_FILES=( uosc )

src_install() {
	mv src/uosc ${PN}
	mv src/uosc.conf ${PN}/

	mpv-plugin_src_install

	insinto /etc/mpv/fonts
	doins src/fonts/*
}
