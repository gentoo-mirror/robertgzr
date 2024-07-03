# Copyright 2020-2024 Robert Günzler
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit go

DESCRIPTION="impl generates method stubs for implementing an interface"
HOMEPAGE="https://github.com/josharian/impl"

inherit git-r3
EGIT_REPO_URI="https://github.com/josharian/impl.git"

LICENSE="MIT"
SLOT="0"
IUSE=""
