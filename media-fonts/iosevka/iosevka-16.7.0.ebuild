# Copyright 2020-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit font

DESCRIPTION="Slender typeface for code, from code"
HOMEPAGE="https://be5invis.github.io/iosevka"

MY_PV=$(ver_rs 3 '-' 4 '.')

MY_SRC_URI="https://github.com/be5invis/${PN}/releases/download/v${MY_PV}/ttf-${PN}"

RESTRICT="network-sandbox"
LICENSE="OFL-1.1"
SLOT="0"
IUSE="aile curly +default etoile slab ss01 ss02 ss03 ss04 ss05 ss06 ss07 ss08 ss09 ss10 ss11 ss12 ss13 ss14 ss15 ss16 ss17 ss18 ss19 ss20 fixed term woff2"
KEYWORDS="amd64 arm arm64 ppc64 x86"

S="${WORKDIR}"
FONT_S="${S}"
FONT_SUFFIX="ttf"

src_unpack() {
	local uris=(
		$(usex default ${MY_SRC_URI} "")
		$(use default && usex fixed ${MY_SRC_URI}-fixed "")
		$(use default && usex term ${MY_SRC_URI}-term "")

		$(usex slab ${MY_SRC_URI}-slab "")
		$(use slab && usex fixed ${MY_SRC_URI}-fixed-slab "")
		$(use slab && usex term ${MY_SRC_URI}-term-slab "")

		$(usex curly ${MY_SRC_URI}-curly "")
		$(usex aile ${MY_SRC_URI}-aile "")
		$(usex etoile ${MY_SRC_URI}-etoile "")
	)

	for i in $(seq 1 20)
	do
		ss=$(printf "ss%02d" "$i")
		uris+=(
			$(usex ${ss} ${MY_SRC_URI}-${ss} "")
			$(use ${ss} && usex fixed ${MY_SRC_URI}-fixed-${ss} "")
			$(use ${ss} && usex term ${MY_SRC_URI}-term-${ss} "")
		)
	done

	for uri in "${uris[@]}"
	do
		wget -O ./"${P}.zip" "${uri}-${MY_PV}.zip" || die
		unpack ./"${P}.zip"
		rm "${P}.zip"
	done
}

src_prepare() {
	default

	if use woff2; then
		FONT_SUFFIX+=" woff2"
	fi
}
