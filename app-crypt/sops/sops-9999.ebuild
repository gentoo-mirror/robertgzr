# Copyright 2020-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit go

DESCRIPTION="simple and flexible tool for managing secrets"
HOMEPAGE="https://github.com/mozilla/sops"

inherit git-r3
EGIT_REPO_URI="https://github.com/mozilla/sops.git"

LICENSE="MIT"
SLOT="0"
IUSE=""

EGO_MAIN="go.mozilla.org/sops/v3/cmd/sops"
