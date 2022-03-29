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
	KEYWORDS="~amd64"
fi

LICENSE="BSD Boost-1.0"
SLOT="0"
IUSE="+pipewire pulseaudio +alsa mpt sndio server +mpris elogind basu"

DEPEND="
	>=dev-libs/boost-1.55.0:=[threads(+)]
	dev-libs/libev
	media-video/ffmpeg
	media-sound/lame
	media-libs/taglib
	net-misc/curl
	sys-libs/zlib
	alsa? ( media-libs/alsa-lib )
	pulseaudio? ( media-sound/pulseaudio )
	pipewire? ( media-video/pipewire )
	mpt? ( media-libs/libopenmpt )
	server? ( net-libs/libmicrohttpd )
	mpris? (
		|| (
			elogind? ( sys-auth/elogind )
			basu? ( sys-libs/basu )
			sys-apps/systemd
		)
	)
"
RDEPEND="${DEPEND}"
BDEPEND=""

PATCHES=(
	"${FILESDIR}/0001-Allow-disabling-plugins-explicitely.patch"
)

src_configure() {
	local mycmakeargs=(
		-DENABLE_ALSA=$(usex alsa true false)
		-DENABLE_PIPEWIRE=$(usex pipewire true false)
		-DENABLE_PULSEAUDIO=$(usex pulseaudio true false)
		-DENABLE_MPRIS=$(usex mpris true false)
		-DUSE_ELOGIND=$(usex elogind true false)
		# -DUSE_BASU=$(usex basu true false)
		-DENABLE_OPENMPT=$(usex mpt true false)
		-DENABLE_SNDIO=$(usex sndio true false )
		-DENABLE_SERVER=$(usex server true false)
		-DENABLE_BUNDLED_TAGLIB=false
		-DBUILD_STANDALONE=false

		# fix for boost detection
		-DBoost_INCLUDE_DIR=${EPREFIX}/usr/include
	)
	cmake_src_configure
}
