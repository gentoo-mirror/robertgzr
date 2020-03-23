
EAPI=7

inherit go-module

DESCRIPTION="git status parser"
HOMEPAGE="https://github.com/robertgzr/porcelain"

EGO_SUM=(
	"github.com/mattn/go-colorable v0.1.4 h1:snbPLB8fVfU9iwbbo30TPtbLRzwWu6aJS6Xh4eaaviA="
	"github.com/mattn/go-colorable v0.1.4/go.mod h1:U0ppj6V5qS13XJ6of8GYAs25YV2eR4EVcfRqFIhoBtE="
	"github.com/mattn/go-isatty v0.0.8/go.mod h1:Iq45c/XA43vh69/j3iqttzPXn0bhXyGjM0Hdxcsrc5s="
	"github.com/mattn/go-isatty v0.0.11/go.mod h1:PhnuNfih5lzO57/f3n+odYbM4JtupLOxQOAqxQCu2WE="
	"github.com/mattn/go-isatty v0.0.12 h1:wuysRhFDzyxgEmMf5xjvJ2M9dZoWAXNNr5LSBS7uHXY="
	"github.com/mattn/go-isatty v0.0.12/go.mod h1:cbi8OIDigv2wuxKPP5vlRcQ1OAZbq2CE4Kysco4FUpU="
	"github.com/robertgzr/color v1.0.1-0.20200126142858-9c6f98750436 h1:bj30270hsCjivr7xEXqtp5qJzlGH+uTe72BA4bxukQ4="
	"github.com/robertgzr/color v1.0.1-0.20200126142858-9c6f98750436/go.mod h1://OoAZ8G4q2scTBL5bRadrtOwpWOMWQxVc3OUpohirY="
	"golang.org/x/sys v0.0.0-20190222072716-a9d3bda3a223/go.mod h1:STP8DvDyc/dI5b8T5hshtkjS+E42TnysNCUPdjciGhY="
	"golang.org/x/sys v0.0.0-20191026070338-33540a1f6037/go.mod h1:h1NjWce9XRLGQEsW7wpKNCjG9DtNlClVuFLEZdDNbEs="
	"golang.org/x/sys v0.0.0-20200116001909-b77594299b42/go.mod h1:h1NjWce9XRLGQEsW7wpKNCjG9DtNlClVuFLEZdDNbEs="
	"golang.org/x/sys v0.0.0-20200124204421-9fbb57f87de9 h1:1/DFK4b7JH8DmkqhUk48onnSfrPzImPoVxuomtbT2nk="
	"golang.org/x/sys v0.0.0-20200124204421-9fbb57f87de9/go.mod h1:h1NjWce9XRLGQEsW7wpKNCjG9DtNlClVuFLEZdDNbEs="
)

go-module_set_globals

if [[ "${PV}" = *9999* ]]; then
	MY_PV="67b01707679322d74309e6e7f1d440d396087036"
else
	MY_PV="${PV}"
fi

SRC_URI="https://github.com/robertgzr/porcelain/archive/${MY_PV}.tar.gz -> ${P}.tar.gz
	${EGO_SUM_SRC_URI}"

LICENSE="MIT"
SLOT="0"
IUSE=""

DEPEND="dev-vcs/git"

S="${WORKDIR}/${PN}-${MY_PV}"

src_compile() {
	emake \
		PREFIX="/usr" \
		VERSION="${MY_PV}" \
		REV="${MY_PV}"
}
