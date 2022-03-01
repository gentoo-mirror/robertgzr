# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit meson

DESCRIPTION="The WoodenBeaver sound theme"
HOMEPAGE="https://github.com/madsrh/WoodenBeaver/"
SRC_URI="https://github.com/madsrh/WoodenBeaver/archive/master.tar.gz"

S=${WORKDIR}/WoodenBeaver-master

LICENSE="CC-BY-SA-3.0"
SLOT="0"
KEYWORDS="~alpha amd64 ~ia64 ~ppc ~ppc64 ~sparc x86"
