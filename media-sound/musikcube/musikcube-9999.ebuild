# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

DESCRIPTION=""
HOMEPAGE="https://musikcube.com/"

if [[ $PV = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI=https://github.com/clangen/musikcube
else
	SRC_URI="https://github.com/clangen/musikcube/archive/${PV}.tar.gz"
fi

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="pipewire pulseaudio alsa mpt vorbis ogg ffmpeg"

DEPEND="
	dev-libs/boost
	dev-libs/libev
	alsa? ( media-libs/alsa-lib )
	ffmpeg? ( media-libs/ffmpeg )
	ogg? ( media-libs/libogg )
	mpt? ( media-libs/libopenmpt )
	vorbis? ( media-libs/libvorbis )
	media-libs/taglib
	net-misc/curl
	sys-libs/zlib
	net-libs/libmicrohttpd
	pipewire? ( media-video/pipewire )
	pulseaudio? ( media-sound/pulseaudio )
"
RDEPEND="${DEPEND}"
BDEPEND=""

PATCHES=(
	"${FILESDIR}/homedir.patch"
)

src_configure() {
	local mycmakeargs=(
		-DENABLE_MPRIS=true
		-DENABLE_PIPEWIRE=true
		-DENABLE_BUNDLED_TAGLIB=false
	)
	cmake_src_configure
}
