# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit font

DESCRIPTION="Slender typeface for code, from code"
HOMEPAGE="https://be5invis.github.io/iosevka"

MY_PV=$(ver_rs 3 '-' 4 '.')

SRC_URI="
	default? ( https://github.com/be5invis/${PN}/releases/download/v${MY_PV}/ttf-${PN}-${MY_PV}.zip )
	fixed? ( https://github.com/be5invis/${PN}/releases/download/v${MY_PV}/ttf-${PN}-fixed-${MY_PV}.zip )
	term? ( https://github.com/be5invis/${PN}/releases/download/v${MY_PV}/ttf-${PN}-term-${MY_PV}.zip )
	aile? ( https://github.com/be5invis/${PN}/releases/download/v${MY_PV}/ttf-${PN}-aile-${MY_PV}.zip )
	etoile? ( https://github.com/be5invis/${PN}/releases/download/v${MY_PV}/ttf-${PN}-etoile-${MY_PV}.zip )

	ss05? (
		https://github.com/be5invis/${PN}/releases/download/v${MY_PV}/ttf-${PN}-ss05-${MY_PV}.zip
		term? ( https://github.com/be5invis/${PN}/releases/download/v${MY_PV}/ttf-${PN}-term-ss05-${MY_PV}.zip )
	)
	ss14? (
		https://github.com/be5invis/${PN}/releases/download/v${MY_PV}/ttf-${PN}-ss14-${MY_PV}.zip
		term? ( https://github.com/be5invis/${PN}/releases/download/v${MY_PV}/ttf-${PN}-term-ss14-${MY_PV}.zip )
	)
"

	# slab? (
	# 	https://github.com/be5invis/${PN}/releases/download/v${MY_PV}/04-${PN}-slab-${MY_PV}.zip
	# 	slab? ( https://github.com/be5invis/${PN}/releases/download/v${MY_PV}/05-${PN}-fixed-slab-${MY_PV}.zip )
	# 	slab? ( https://github.com/be5invis/${PN}/releases/download/v${MY_PV}/06-${PN}-term-slab-${MY_PV}.zip )
	# )
	# curly? (
	# 	https://github.com/be5invis/${PN}/releases/download/v${MY_PV}/07-${PN}-curly-${MY_PV}.zip
	# 	fixed? ( https://github.com/be5invis/${PN}/releases/download/v${MY_PV}/08-${PN}-fixed-curly-${MY_PV}.zip )
	# 	term? ( https://github.com/be5invis/${PN}/releases/download/v${MY_PV}/09-${PN}-term-curly-${MY_PV}.zip )
	# 	slab? (
	# 		https://github.com/be5invis/${PN}/releases/download/v${MY_PV}/10-${PN}-curly-slab-${MY_PV}.zip
	# 		fixed? ( https://github.com/be5invis/${PN}/releases/download/v${MY_PV}/11-${PN}-fixed-curly-slab-${MY_PV}.zip )
	# 		curly? ( https://github.com/be5invis/${PN}/releases/download/v${MY_PV}/12-${PN}-term-curly-slab-${MY_PV}.zip )
	# 	)
	# )

	# ss01? (
	# 	https://github.com/be5invis/${PN}/releases/download/v${MY_PV}/${PN}-ss01-${MY_PV}.zip
	# 	term? ( https://github.com/be5invis/${PN}/releases/download/v${MY_PV}/${PN}-term-ss01-${MY_PV}.zip )
	# )
	# ss02? (
	# 	https://github.com/be5invis/${PN}/releases/download/v${MY_PV}/${PN}-ss02-${MY_PV}.zip
	# 	term? ( https://github.com/be5invis/${PN}/releases/download/v${MY_PV}/${PN}-term-ss02-${MY_PV}.zip )
	# )
	# ss03? (
	# 	https://github.com/be5invis/${PN}/releases/download/v${MY_PV}/${PN}-ss03-${MY_PV}.zip
	# 	term? ( https://github.com/be5invis/${PN}/releases/download/v${MY_PV}/${PN}-term-ss03-${MY_PV}.zip )
	# )
	# ss04? (
	# 	https://github.com/be5invis/${PN}/releases/download/v${MY_PV}/${PN}-ss04-${MY_PV}.zip
	# 	term? ( https://github.com/be5invis/${PN}/releases/download/v${MY_PV}/${PN}-term-ss04-${MY_PV}.zip )
	# )

	# ss06? (
	# 	https://github.com/be5invis/${PN}/releases/download/v${MY_PV}/${PN}-ss06-${MY_PV}.zip
	# 	term? ( https://github.com/be5invis/${PN}/releases/download/v${MY_PV}/${PN}-term-ss06-${MY_PV}.zip )
	# )
	# ss07? (
	# 	https://github.com/be5invis/${PN}/releases/download/v${MY_PV}/${PN}-ss07-${MY_PV}.zip
	# 	term? ( https://github.com/be5invis/${PN}/releases/download/v${MY_PV}/${PN}-term-ss07-${MY_PV}.zip )
	# )
	# ss08? (
	# 	https://github.com/be5invis/${PN}/releases/download/v${MY_PV}/${PN}-ss08-${MY_PV}.zip
	# 	term? ( https://github.com/be5invis/${PN}/releases/download/v${MY_PV}/${PN}-term-ss08-${MY_PV}.zip )
	# )
	# ss09? (
	# 	https://github.com/be5invis/${PN}/releases/download/v${MY_PV}/${PN}-ss09-${MY_PV}.zip
	# 	term? ( https://github.com/be5invis/${PN}/releases/download/v${MY_PV}/${PN}-term-ss09-${MY_PV}.zip )
	# )
	# ss10? (
	# 	https://github.com/be5invis/${PN}/releases/download/v${MY_PV}/${PN}-ss10-${MY_PV}.zip
	# 	term? ( https://github.com/be5invis/${PN}/releases/download/v${MY_PV}/${PN}-term-ss10-${MY_PV}.zip )
	# )
	# ss11? (
	# 	https://github.com/be5invis/${PN}/releases/download/v${MY_PV}/${PN}-ss11-${MY_PV}.zip
	# 	term? ( https://github.com/be5invis/${PN}/releases/download/v${MY_PV}/${PN}-term-ss11-${MY_PV}.zip )
	# )
	# ss12? (
	# 	https://github.com/be5invis/${PN}/releases/download/v${MY_PV}/${PN}-ss12-${MY_PV}.zip
	# 	term? ( https://github.com/be5invis/${PN}/releases/download/v${MY_PV}/${PN}-term-ss12-${MY_PV}.zip )
	# )
	# ss13? (
	# 	https://github.com/be5invis/${PN}/releases/download/v${MY_PV}/${PN}-ss13-${MY_PV}.zip
	# 	term? ( https://github.com/be5invis/${PN}/releases/download/v${MY_PV}/${PN}-term-ss13-${MY_PV}.zip )
	# )
	# ss14? (
	# 	https://github.com/be5invis/${PN}/releases/download/v${MY_PV}/${PN}-ss14-${MY_PV}.zip
	# 	term? ( https://github.com/be5invis/${PN}/releases/download/v${MY_PV}/${PN}-term-ss14-${MY_PV}.zip )
	# )

LICENSE="OFL-1.1"
SLOT="0"
IUSE="aile curly +default etoile slab ss01 ss02 ss03 ss04 ss05 ss06 ss07 ss08 ss09 ss10 ss11 ss12 ss13 ss14 +fixed term unhinted woff2"
KEYWORDS="amd64 arm arm64 ppc64 x86"

DEPEND="app-arch/unzip"

S="${WORKDIR}"
FONT_S="${S}"
FONT_SUFFIX="ttf"

src_prepare() {
	default

	if use woff2; then
		FONT_SUFFIX+=" woff2"
	fi
}
