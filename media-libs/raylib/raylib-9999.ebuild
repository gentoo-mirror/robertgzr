
EAPI=7
inherit cmake-utils

DESCRIPTION="A simple and easy-to-use library to enjoy videogames programming"
HOMEPAGE="https://www.raylib.com/"
SRC_URI="https://github.com/raysan5/raylib/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="ZLIB"
SLOT="0"
IUSE="alsa examples games static-libs system-glfw wayland"

if [[ ${PV} == *9999* ]] ; then
	EGIT_REPO_URI="https://github.com/raysan5/raylib.git"
	inherit git-r3
else
	SRC_URI="https://github.com/raysan5/raylib/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

RDEPEND="
	alsa? ( media-libs/alsa-lib )
	!wayland? (
		system-glfw? ( >=media-libs/glfw-3.2.1 )
		virtual/opengl
		x11-libs/libX11
		x11-libs/libXcursor
		x11-libs/libXi
		x11-libs/libXinerama
		x11-libs/libXrandr
		x11-libs/libXxf86vm
	)
	wayland? (
		system-glfw? ( >=media-libs/glfw-3.2.1[wayland] )
		dev-libs/wayland
		media-libs/mesa[egl,wayland]
	)
"
DEPEND="${RDEPEND}"

src_configure() {
	local mycmakeargs=(
		-DCMAKE_INSTALL_LIBDIR=$(get_libdir)
		-DSHARED=$(usex !static-libs ON OFF)
		-DSTATIC=$(usex static-libs ON OFF)
		-DUSE_AUDIO=$(usex alsa ON OFF)
		-DUSE_EXTERNAL_GLFW=$(usex system-glfw ON OFF)
		-DUSE_WAYLAND=$(usex wayland ON OFF)
		-DBUILD_EXAMPLES=OFF
		-DBUILD_GAMES=OFF
	)
	cmake-utils_src_configure
}

src_install() {
	cmake-utils_src_install

	if use examples; then
		docompress -x /usr/share/doc/${PF}/examples
		insinto /usr/share/doc/${PF}/examples
		doins -r "${S}"/examples/*
	fi
	if use games; then
		docompress -x /usr/share/doc/${PF}/games
		insinto /usr/share/doc/${PF}/games
		doins -r "${S}"/games/*
	fi
}
