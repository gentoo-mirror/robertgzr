# Copyright 2024 Robert Günzler
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit meson

DESCRIPTION="daemon to submit song data to libre.fm and listenbrainz.org"
HOMEPAGE="https://github.com/mariusor/mpris-scrobbler"

if [[ ${PV} = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI=${HOMEPAGE}
else
	SRC_URI="${HOMEPAGE}/archive/refs/tags/v${PV}.tar.gz"
	KEYWORDS="~amd64"
fi

LICENSE="MIT"
SLOT="0"

DEPEND="
	dev-libs/json-c
	dev-libs/libevent
	net-misc/curl
	>=sys-apps/dbus-1.9
"
