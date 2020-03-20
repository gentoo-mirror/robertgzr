# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit go-module

DESCRIPTION="user-friendly IRC bouncer"
HOMEPAGE="https://git.sr.ht/~emersion/soju"

EGO_SUM=(
	"github.com/davecgh/go-spew v1.1.0"
	"github.com/davecgh/go-spew v1.1.0/go.mod"
	"github.com/emersion/go-sasl v0.0.0-20191210011802-430746ea8b9b"
	"github.com/emersion/go-sasl v0.0.0-20191210011802-430746ea8b9b/go.mod"
	"github.com/google/shlex v0.0.0-20191202100458-e7afc7fbc510"
	"github.com/google/shlex v0.0.0-20191202100458-e7afc7fbc510/go.mod"
	"github.com/mattn/go-sqlite3 v2.0.3+incompatible"
	"github.com/mattn/go-sqlite3 v2.0.3+incompatible/go.mod"
	"github.com/pmezard/go-difflib v1.0.0"
	"github.com/pmezard/go-difflib v1.0.0/go.mod"
	"github.com/stretchr/objx v0.1.0/go.mod"
	"github.com/stretchr/testify v1.4.0"
	"github.com/stretchr/testify v1.4.0/go.mod"
	"golang.org/x/crypto v0.0.0-20190308221718-c2843e01d9a2/go.mod"
	"golang.org/x/crypto v0.0.0-20200317142112-1b76d66859c6"
	"golang.org/x/crypto v0.0.0-20200317142112-1b76d66859c6/go.mod"
	"golang.org/x/net v0.0.0-20190404232315-eb5bcb51f2a3/go.mod"
	"golang.org/x/sys v0.0.0-20190215142949-d0b11bdaac8a/go.mod"
	"golang.org/x/sys v0.0.0-20190412213103-97732733099d"
	"golang.org/x/sys v0.0.0-20190412213103-97732733099d/go.mod"
	"golang.org/x/sys v0.0.0-20200317113312-5766fd39f98d"
	"golang.org/x/sys v0.0.0-20200317113312-5766fd39f98d/go.mod"
	"golang.org/x/text v0.3.0/go.mod"
	"gopkg.in/check.v1 v0.0.0-20161208181325-20d25e280405"
	"gopkg.in/check.v1 v0.0.0-20161208181325-20d25e280405/go.mod"
	"gopkg.in/irc.v3 v3.1.2"
	"gopkg.in/irc.v3 v3.1.2/go.mod"
	"gopkg.in/yaml.v2 v2.2.2/go.mod"
	"gopkg.in/yaml.v2 v2.2.8"
	"gopkg.in/yaml.v2 v2.2.8/go.mod"
)

go-module_set_globals

if [[ "${PV}" = *9999* ]]; then
	MY_PV="7714c8466963028b7d8091ef2430d0e84d073d52"
else
	MY_PV="${PV}"
fi

SRC_URI="https://git.sr.ht/~emersion/soju/archive/${MY_PV}.tar.gz -> ${P}.tar.gz
	${EGO_SUM_SRC_URI}"

LICENSE="MIT"
SLOT="0"
IUSE=""

DEPEND=""

S="${WORKDIR}/${PN}-${MY_PV}"

src_compile() {
	emake PREFIX="/usr"
}
