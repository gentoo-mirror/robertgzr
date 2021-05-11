# Copyright 2020-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3 go-module

EGO_SUM=(
	"github.com/mattn/go-colorable v0.1.4"
	"github.com/mattn/go-colorable v0.1.4/go.mod"
	"github.com/mattn/go-isatty v0.0.8/go.mod"
	"github.com/mattn/go-isatty v0.0.11/go.mod"
	"github.com/mattn/go-isatty v0.0.12"
	"github.com/mattn/go-isatty v0.0.12/go.mod"
	"github.com/robertgzr/color v1.0.1-0.20200126142858-9c6f98750436"
	"github.com/robertgzr/color v1.0.1-0.20200126142858-9c6f98750436/go.mod"
	"golang.org/x/sys v0.0.0-20190222072716-a9d3bda3a223/go.mod"
	"golang.org/x/sys v0.0.0-20191026070338-33540a1f6037/go.mod"
	"golang.org/x/sys v0.0.0-20200116001909-b77594299b42/go.mod"
	"golang.org/x/sys v0.0.0-20200124204421-9fbb57f87de9"
	"golang.org/x/sys v0.0.0-20200124204421-9fbb57f87de9/go.mod"
)
go-module_set_globals

DESCRIPTION="git status parser"
HOMEPAGE="https://github.com/robertgzr/porcelain"

SRC_URI="https://github.com/robertgzr/${PN}/archive/v${PV}.tar.gz
	${EGO_SUM_SRC_URI}"

LICENSE="MIT"
SLOT="0"
IUSE=""
KEYWORDS="~amd64 ~arm64 ~x86"

src_compile() {
	emake VERSION="${PV}"
}

src_install() {
	emake DESTDIR="${ED}" PREFIX=/usr install
}
