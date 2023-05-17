# Copyright 2020-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit go

DESCRIPTION="official go language server"
HOMEPAGE="https://github.com/golang/tools/blob/master/gopls"

inherit git-r3
EGIT_REPO_URI="https://github.com/golang/tools.git"
S="${WORKDIR}/${P}/gopls"

LICENSE="MIT"
SLOT="0"
IUSE=""
