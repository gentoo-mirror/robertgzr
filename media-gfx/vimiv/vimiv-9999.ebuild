# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( python3_{9..11} )
inherit distutils-r1

DESCRIPTION="image viewer with vim-like keybindings"
HOMEPAGE="https://karlch.github.io/vimiv-qt/"

inherit git-r3
EGIT_REPO_URI="https://github.com/karlch/vimiv-qt"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE="svg exif printsupport"

DEPEND="
	>=dev-qt/qtcore-5.11.3
	>=dev-python/PyQt5-5.11.3[widgets,svg?,printsupport?]
	exif? ( dev-python/piexif )
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	distutils-r1_src_prepare

	if ! use printsupport; then
		ewarn "removing print plugin"
		rm -v ${S}/${PN}/plugins/print.py
	fi
}
