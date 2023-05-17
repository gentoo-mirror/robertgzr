# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit font

DESCRIPTION="CJK programming font based on Iosevka and Source Han Sans"
HOMEPAGE="https://github.com/be5invis/Sarasa-Gothic"
SRC_URI="https://github.com/be5invis/Sarasa-Gothic/releases/download/v${PV}/sarasa-gothic-ttf-${PV}.7z"

LICENSE="OFL-1.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="chinese japanese korean"

DEPEND="
	app-arch/p7zip
"
RDEPEND="${DEPEND}"

S="${WORKDIR}"
FONT_S="${S}"
FONT_SUFFIX="ttf"

src_unpack() {
	to_unpack=
	use chinese && to_unpack="${to_unpack} *-fixed-c-*.ttf"
	use japanese && to_unpack="${to_unpack} *-fixed-j-*.ttf"
	use korean && to_unpack="${to_unpack} *-fixed-k-*.ttf"

	[ -z "${to_unpack}" ] && { eerror "Nothing to unpack!\n"; exit 1; }
	7z x -o${WORKDIR} ${DISTDIR}/${A} ${to_unpack}
}
