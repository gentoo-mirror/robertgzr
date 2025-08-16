# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit meson

DESCRIPTION="Independent session/login tracker"
HOMEPAGE="https://github.com/chimera-linux/turnstile"

if [[ $PV = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/chimera-linux/turnstile.git"
	KEYWORDS=""
else
	SRC_URI="https://github.com/chimera-linux/turnstile/archive/refs/tags/v${PV}.tar.gz"
	KEYWORDS=""
fi

LICENSE="BSD-2"
SLOT="0"
IUSE="man dinit runit"

DEPEND="
	sys-libs/pam
"
RDEPEND="${DEPEND}"
BDEPEND="
	man? ( >=app-text/scdoc-1.10 )
"

src_configure() {
	local emesonargs=(
		$(meson_feature dinit)
		$(meson_feature runit)
	)
	meson_src_configure
}
