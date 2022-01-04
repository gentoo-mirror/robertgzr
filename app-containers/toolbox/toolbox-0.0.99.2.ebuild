# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit bash-completion-r1 meson go-module tmpfiles

DESCRIPTION="containerized command line environments on Linux"
HOMEPAGE="https://github.com/containers/toolbox"

if [[ "${PV}" = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/containers/toolbox.git"
else
	SRC_URI="https://github.com/containers/toolbox/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
fi

RESTRICT="network-sandbox"
LICENSE="Apache-2.0"
SLOT="0"

DEPEND="
	>=app-containers/podman-1.4
	dev-go/go-md2man
"
RDEPEND="${DEPEND}"
BDEPEND="
	>=dev-lang/go-1.13
"

src_unpack() {
	default
	[[ "${PV}" = *9999* ]] && git-r3_src_unpack
	cd src && go-module_live_vendor
}

src_configure() {
	local emesonargs=(
		"-Dtmpfiles_dir=/usr/lib/tmpfiles.d"
		"-Dprofile_dir=/etc/profile.d"
	)
	meson_src_configure
}

src_compile() {
	meson_src_compile

	cd src || die
	CGO_ENABLED=0 \
	go build -x \
		-trimpath \
		-ldflags "-s -w -X github.com/containers/toolbox/pkg/version.currentVersion=${PV}" \
		-tags 'netgo,osusergo,static_build' \
		-o ${BUILD_DIR}/src/${PN}

	sed -e 's#usr/lib/os-release#etc/os-release#' -i ${S}/profile.d/toolbox.sh
}

pkg_postinst() {
	tmpfiles_process toolbox.conf
}
