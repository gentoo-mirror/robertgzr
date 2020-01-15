
EAPI=7

DESCRIPTION="Flash your ZSA keyboard the EZ way"
HOMEPAGE="https://ergodox-ez.com/pages/wally"
SRC_URI="https://github.com/zsa/wally/releases/download/${PV}-linux/wally-cli -> ${PN}
	gui? ( https://github.com/zsa/wally/releases/download/${PV}-linux/wally -> ${PN}-gui )"
RESTRICT="mirror strip"

S=${DISTDIR}

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="gui"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	dobin ${DISTDIR}/${PN}
	use gui && dobin ${DISDIR}/${PN}-gui
}
