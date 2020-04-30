# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit meson

DESCRIPTION="A minimal POSIX shell"
HOMEPAGE="https://mrsh.sh/"

if [[ ${PV} = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://git.sr.ht/~emersion/${PN}"
else
	SRC_URI="https://git.sr.ht/~emersion/${PN}/releases/download/v${PV}/${P}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~arm64 ~x86"
fi

LICENSE="MIT"
SLOT="0"
IUSE="+readline libedit examples reference-shell"

DEPEND="
	readline? (
		|| (
			libedit? ( dev-libs/libedit )
			sys-libs/readline
		)
	)
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	local emesonargs=(
		$(meson_feature readline)
		$(meson_use examples)
		$(meson_use reference-shell)
	)
	meson_src_configure
}
