# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit go

DESCRIPTION="tag our files and access them through a VFS from anywhere"
HOMEPAGE="https://tmsu.org/"
# SRC_URI="https://github.com/oniony/TMSU/archive/refs/tags/v${PV}.tar.gz"

inherit git-r3
EGIT_REPO_URI="https://github.com/oniony/TMSU.git"

LICENSE="GPL-3 BSD MIT"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="network-sandbox"

DEPEND="
	dev-db/sqlite:3
	sys-fs/fuse
"
RDEPEND="${DEPEND}"
