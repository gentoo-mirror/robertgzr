# Copyright 2020-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="a bash-tool to store your private data inside a git repository"
HOMEPAGE="https://git-secret.io/"
SRC_URI="https://github.com/sobolevn/git-secret/archive/v${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="man"

# bash 3.2.57
# gawk 4.0.2
# gpg 1.4-2.x
# sha256sum 8.21
# git 1.8.3.1
DEPEND="
	man? ( app-text/ronn )
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_compile() {
	emake build
	use man && emake build-man
}

src_install() {
	emake install PREFIX="${ED}/usr"
	use man && emake install-man PREFIX="${ED}/usr"
}
