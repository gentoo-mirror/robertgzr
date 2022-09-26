# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cargo flag-o-matic

DESCRIPTION="A modernized, complete, self-contained TeX/LaTeX engine."
HOMEPAGE="https://tectonic-typesetting.github.io/"

if [[ ${PV} = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/tectonic-typesetting/${PN}.git"
	EGIT_SUBMODULES=( '*' '-crates/bridge_harfbuzz/harfbuzz' )
else
	SRC_URI="
		https://github.com/tectonic-typesetting/${PN}/archive/refs/tags/${PN}@${PV}.tar.gz -> ${P}.tar.gz
		$(cargo_crate_uris ${CRATES})
	"
	S="${WORKDIR}/${PN}-${P}"
	KEYWORDS="~amd64"
fi


LICENSE="Apache-2.0 Artistic-2 BSD-2 BSD CC0-1.0 ISC MIT WTFPL-2"
SLOT="0"
IUSE="doc"

DEPEND="
	dev-libs/icu
	dev-libs/openssl
	media-gfx/graphite2
	media-libs/fontconfig
	media-libs/freetype:2
	media-libs/harfbuzz[graphite,icu]
	media-libs/libpng
	sys-libs/zlib
"
RDEPEND="${DEPEND}"
BDEPEND="doc? ( app-text/mdbook )"

src_unpack() {
	if [[ ${PV} = *9999* ]]; then
		git-r3_src_unpack
		cargo_live_src_unpack
	else
		cargo_src_unpack
	fi
}

src_configure() {
	# Test fails with -ftree-slp-vectorize, therefore disable
	append-flags -fno-tree-slp-vectorize
	# Linker fails with lto enabled
	filter-flags -flto*

	local myfeatures=(
		external-harfbuzz
	)

	cargo_src_configure
}

src_compile() {
	cargo_src_compile

	if use doc; then
	   pushd docs || die
		mdbook build || die
		HTML_DOCS="${S}/docs/book"
	   popd || die
	fi
}

src_install() {
	cargo_src_install
	einstalldocs
}
