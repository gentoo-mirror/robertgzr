# Copyright 2022-2024 Robert Günzler
# Distributed under the terms of the GNU General Public License v2

EAPI=8

USE_MPV="rdepend"
MPV_REQ_USE="lua"
inherit mpv-plugin

DESCRIPTION="Simple WebM maker for mpv, with no external dependencies."
HOMEPAGE="https://github.com/ekisu/webm"

LICENSE="MIT"
KEYWORDS="~amd64"
RESTRICT="network-sandbox"

S=${WORKDIR}

MPV_PLUGIN_FILES=( ${PN} )

src_unpack() {
	mkdir -p ${PN} ${PN}/script-opts
	wget -O ${PN}/main.lua https://github.com/ekisu/mpv-webm/releases/download/latest/webm.lua
	wget -O ${PN}/script-opts/webm.conf https://github.com/ekisu/mpv-webm/releases/download/latest/webm.conf
}
