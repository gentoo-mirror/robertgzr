# Copyright 2020-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit go

DESCRIPTION="general purpose language server"
HOMEPAGE="https://github.com/mattn/efm-langserver"

inherit git-r3
EGIT_COMMIT="26be4445542b8aa1aa0233a856ade7161644035c" # v0.0.26
EGIT_REPO_URI="https://github.com/mattn/efm-langserver.git"

LICENSE="MIT"
SLOT="0"
IUSE=""
