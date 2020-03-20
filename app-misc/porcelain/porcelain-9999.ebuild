
EAPI=7

inherit go-module

DESCRIPTION="git status parser"
HOMEPAGE="https://github.com/robertgzr/porcelain"

EGO_PN="github.com/robertgzr/${PN}"
EGO_COMMIT="28d7a76cd2a00eee59dd6582584822541bf33f7d"
EGO_VENDOR=(
	"github.com/robertgzr/color 9c6f98750436"
		"github.com/mattn/go-isatty v0.0.12"
			"github.com/mattn/go-colorable v0.1.4"
		"golang.org/x/sys 9fbb57f87de9 github.com/golang/sys"
)

MY_P="${PN}-${EGO_COMMIT}"
SRC_URI="https://${EGO_PN}/archive/${EGO_COMMIT}.tar.gz -> ${MY_P}.tar.gz
	$(go-module_vendor_uris)"

RESTRICT="strip mirrors"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

S="${WORKDIR}/${MY_P}"

DEPEND=""
RDEPEND="dev-vcs/git"

src_compile() {
	go build -v \
		-ldflags "-s -w -X main.date=$(date -u +%Y-%m-%d_%I:%M:%S%p) -X main.commit=${EGO_COMMIT} -X main.version=${PV}"
}

src_install() {
	dobin porcelain
}
