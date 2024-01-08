# Copyright 2020-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit font

DESCRIPTION="Slender typeface for code, from code"
HOMEPAGE="https://be5invis.github.io/iosevka"

MY_PV=$(ver_rs 3 '-' 4 '.')

MY_SRC_URI="https://github.com/be5invis/${PN}/releases/download/v${MY_PV}/PkgTTF-${PN}"

RESTRICT="network-sandbox"
LICENSE="OFL-1.1"
SLOT="0"
IUSE="aile curly +default etoile slab ss01 ss02 ss03 ss04 ss05 ss06 ss07 ss08 ss09 ss10 ss11 ss12 ss13 ss14 ss15 ss16 ss17 ss18 ss19 ss20 fixed term woff2"
KEYWORDS=""

S="${WORKDIR}"
FONT_S="${S}"
FONT_SUFFIX="ttf"

src_unpack() {
	local uris=(
		$(usex default ${MY_SRC_URI} "")
		$(use default && usex fixed ${MY_SRC_URI}Fixed "")
		$(use default && usex term ${MY_SRC_URI}Term "")

		$(usex slab ${MY_SRC_URI}-slab "")
		$(use slab && usex fixed ${MY_SRC_URI}FixedSlab "")
		$(use slab && usex term ${MY_SRC_URI}TermSlab "")

		$(usex curly ${MY_SRC_URI}Curly "")
		$(usex aile ${MY_SRC_URI}Aile "")
		$(usex etoile ${MY_SRC_URI}Etoile "")
	)

	for i in $(seq 1 20)
	do
		ss_use=$(printf "ss%02d" "$i")
		ss_str=$(tr 's' 'S' <<<$ss_use)
		uris+=(
			$(usex ${ss_use} ${MY_SRC_URI}${ss_str} "")
			$(use ${ss_use} && usex fixed ${MY_SRC_URI}Fixed${ss_str} "")
			$(use ${ss_use} && usex term ${MY_SRC_URI}Term${ss_str} "")
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
