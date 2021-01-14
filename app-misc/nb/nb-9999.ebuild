# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit bash-completion-r1

DESCRIPTION="CLI plain-text note-taking, bookmarking, and archiving."
HOMEPAGE="https://xwmx.github.io/nb"

if [[ ${PV} = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/xwmx/nb.git"
else
	SRC_URI="https://github.com/xwmx/nb/archive/${PV}.tar.gz"
fi

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+bookmark bash-completion"

DEPEND="
	app-shells/bash
	dev-vcs/git
	virtual/editor
"
RDEPEND="${DEPEND}"

src_compile() {
	true
}

src_install() {
	dobin nb
	use bookmark && dobin bin/bookmark
	use bash-completion && newbashcomp etc/nb-completion.bash ${PN}
}
