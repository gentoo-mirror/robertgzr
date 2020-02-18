# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit font

DESCRIPTION="Slender typeface for code, from code"
HOMEPAGE="https://be5invis.github.io/Iosevka/"

MY_PV=$(ver_rs 3 '-' 4 '.')

SRC_URI="
	default? ( https://github.com/be5invis/${PN}/releases/download/v${MY_PV}/01-${PN}-${MY_PV}.zip )
	slab? ( https://github.com/be5invis/${PN}/releases/download/v${MY_PV}/05-${PN}-slab-${MY_PV}.zip )
	curly? ( https://github.com/be5invis/${PN}/releases/download/v${MY_PV}/09-${PN}-curly-${MY_PV}.zip )
	term? (
		https://github.com/be5invis/${PN}/releases/download/v${MY_PV}/02-${PN}-term-${MY_PV}.zip
	)
	type? (
		https://github.com/be5invis/${PN}/releases/download/v${MY_PV}/03-${PN}-type-${MY_PV}.zip
	)
	termlig? (
		https://github.com/be5invis/${PN}/releases/download/v${MY_PV}/04-${PN}-term-lig-${MY_PV}.zip
	)
	aile? ( https://github.com/be5invis/${PN}/releases/download/v${MY_PV}/${PN}-aile-${MY_PV}.zip )
	etoile? ( https://github.com/be5invis/${PN}/releases/download/v${MY_PV}/${PN}-etoile-${MY_PV}.zip )
	sparkle? ( https://github.com/be5invis/${PN}/releases/download/v${MY_PV}/${PN}-sparkle-${MY_PV}.zip )
	ss05? ( https://github.com/be5invis/${PN}/releases/download/v${MY_PV}/${PN}-ss05-${MY_PV}.zip )
	ss08? ( https://github.com/be5invis/${PN}/releases/download/v${MY_PV}/${PN}-ss08-${MY_PV}.zip )
"
		# slab? ( https://github.com/be5invis/${PN}/releases/download/v${MY_PV}/06-${PN}-term-slab-${MY_PV}.zip )
		# curly? ( https://github.com/be5invis/${PN}/releases/download/v${MY_PV}/10-${PN}-term-slab-${MY_PV}.zip )
		# slab? ( https://github.com/be5invis/${PN}/releases/download/v${MY_PV}/07-${PN}-type-slab-${MY_PV}.zip )
		# curly? ( https://github.com/be5invis/${PN}/releases/download/v${MY_PV}/11-${PN}-type-slab-${MY_PV}.zip )
		# slab? ( https://github.com/be5invis/${PN}/releases/download/v${MY_PV}/08-${PN}-term-lig-slab-${MY_PV}.zip )
		# curly? ( https://github.com/be5invis/${PN}/releases/download/v${MY_PV}/12-${PN}-term-lig-slab-${MY_PV}.zip )

LICENSE="OFL-1.1"
SLOT="0"
IUSE="aile curly +default etoile slab sparkle ss05 ss08 +term termlig type unhinted woff woff2"
KEYWORDS="~amd64 ~arm ~arm64 ~ppc64 ~x86"

DEPEND="app-arch/unzip"

S="${WORKDIR}"
FONT_S="${S}/ttf"
FONT_SUFFIX="ttf"

src_prepare() {
	default

	if use unhinted; then
		FONT_S+=" ${S}/unhinted-ttf"
	elif use woff; then
		FONT_S+=" ${S}/woff"
		FONT_SUFFIX+=" woff"
	elif use woff2; then
		FONT_S+=" ${S}/woff2"
		FONT_SUFFIX+=" woff2"
	fi
}
