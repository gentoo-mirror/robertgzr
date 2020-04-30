# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="mount http directory listing"
HOMEPAGE="https://github.com/fangfufu/httpdirfs"

if [[ ${PV} = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/fangfufu/${PN}.git"
else
	SRC_URI="https://github.com/fangfufu/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
fi

LICENSE="GPL-3"
SLOT="0"
IUSE=""
KEYWORDS="~amd64 ~arm64 ~x86"

DEPEND=">=sys-fs/fuse-2.2:0=
	>=dev-libs/gumbo-0.10.1"
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	emake DESTDIR=${D} prefix=/usr install
}
