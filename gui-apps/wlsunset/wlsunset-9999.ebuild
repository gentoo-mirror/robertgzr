# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit meson

DESCRIPTION="Day/night gamma adjustments for Wayland"
HOMEPAGE="https://sr.ht/~kennylevinsen/wlsunset"

inherit git-r3
EGIT_REPO_URI="https://git.sr.ht/~kennylevinsen/wlsunset"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""

DEPEND="
	dev-libs/wayland
	>=app-text/scdoc-1.9.7
"
RDEPEND="${DEPEND}"
BDEPEND="
	dev-util/wayland-scanner
	dev-libs/wayland-protocols
"
