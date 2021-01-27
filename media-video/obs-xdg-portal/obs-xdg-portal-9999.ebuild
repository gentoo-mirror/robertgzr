# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit meson

DESCRIPTION="OBS Studio plugin using the desktop portal for screensharing"
HOMEPAGE="https://gitlab.gnome.org/feaneron/obs-xdg-portal"

inherit git-r3
EGIT_REPO_URI="https://gitlab.gnome.org/feaneron/obs-xdg-portal.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPENDS="
	>=media-video/pipewire-0.3.17
"

PATCHES=(
	"${FILESDIR}/libdir.patch"
)
