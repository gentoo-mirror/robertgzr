# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

USE_MPV="rdepend"
MPV_REQ_USE="lua"
inherit mpv-plugin

DESCRIPTION="Simple sponsorblock implementation for MPV"
HOMEPAGE="https://github.com/po5/mpv_sponsorblock"

inherit git-r3
EGIT_REPO_URI="${HOMEPAGE}"

LICENSE="GPL-3"
KEYWORDS="~amd64"
RESTRICT="network-sandbox"

MPV_PLUGIN_FILES=( sponsorblock.lua main.lua ${PN}_shared )

PATCHES=(
	"$FILESDIR"/scriptdir.patch
)
