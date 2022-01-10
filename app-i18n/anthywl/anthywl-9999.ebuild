# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit meson

DESCRIPTION="japanese input method for wlroots-based compositors"
HOMEPAGE="https://github.com/tadeokondrak/anthywl"

inherit git-r3
EGIT_REPO_URI="https://github.com/tadeokondrak/anthywl.git"

LICENSE="ISC"
SLOT="0"
KEYWORDS=""

DEPEND="
	app-i18n/anthy
	dev-libs/libscfg
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	dobin ${BUILD_DIR}/${PN}
}

pkg_postinst() {
	ewarn "This is project is WIP."
	ewarn ""
	ewarn "To use anthywl you will need to patch gui-libs/wlroots and gui-wm/sway"
	ewarn "The following PRs are relevant:"
	ewarn "--> https://github.com/swaywm/wlroots/pull/2550"
	ewarn "--> https://github.com/swaywm/sway/pull/5890"
	ewarn ""
}
