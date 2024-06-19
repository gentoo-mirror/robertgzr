# Copyright 2020-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit font unpacker

DESCRIPTION="Slender typeface for code, from code"
HOMEPAGE="https://be5invis.github.io/iosevka"

MY_PV=$(ver_rs 3 '-' 4 '.')

MY_SRC_URI_base="https://github.com/be5invis/${PN}/releases/download/v${MY_PV}/"
MY_SRC_URI_build() {
	local -a comp

	# print base uri and first argument (concat without delimiter)
	printf %s ${MY_SRC_URI_base} $1
	shift 1

	# concat rest of arguments with "-" delimiter
	comp+=(${@})
	comp+=(${MY_PV}.zip)
	printf %s ${comp[@]/#/-}
}

RESTRICT="network-sandbox"
LICENSE="OFL-1.1"
SLOT="0"
IUSE="aile curly +default etoile slab ss01 ss02 ss03 ss04 ss05 ss06 ss07 ss08 ss09 ss10 ss11 ss12 ss13 ss14 ss15 ss16 ss17 ss18 ss19 ss20 fixed term unhinted woff2"
KEYWORDS=""

S="${WORKDIR}"
FONT_S="${S}"
FONT_SUFFIX="ttf"

src_unpack() {
	local -a pkgs
	local -a widths
	local -a variants

	pkgs+=(
		"PkgTTF"
		$(use unhinted && echo "PkgTTF-Unhinted")
		$(use woff2 && echo "PkgWebFont")
		$(use woff2 && use unhinted && echo "PkgWebFont-Unhinted")
	)

	widths+=(
		""
		$(use fixed && echo "Fixed")
		$(use term && echo "Term")
	)

	variants+=(
		$(use default && echo "Iosevka")
		$(use slab && echo "IosevkaSlab")
		$(use curly && echo "IosevkaCurly")
		$(use aile && echo "IosevkaAile")
		$(use etoile && echo "IosevkaEtoile")
	)
	for i in $(seq 1 20)
	do
		ss_use=$(printf "ss%02d" "$i")
		ss_str=$(tr 's' 'S' <<<$ss_use)
		variants+=( $(use ${ss_use} && echo "Iosevka${ss_str}") )
	done

	for variant in "${variants[@]}"
	do
		for pkg in "${pkgs[@]}"
		do
			for width in "${widths[@]}"
			do
				local uri=$(MY_SRC_URI_build $pkg $variant$width)
				local filename=${uri##*/}
				local archive=${WORKDIR}/${filename}

				if [[ ! -f ${archive} ]]; then
					wget -O "${archive}" "${uri}" || die "Fetching failed: ${uri}"
				fi

				# TODO: test checksums against:
				# https://github.com/be5invis/Iosevka/blob/v29.0.1/doc/packages-sha.txt?

				unpack_zip "${archive}" || die
			done
		done
	done
	set +x
}

src_prepare() {
	default

	if use woff2; then
		FONT_SUFFIX+=" woff2"
	fi
}
