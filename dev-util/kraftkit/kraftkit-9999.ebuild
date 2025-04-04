# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit go-module

DESCRIPTION=""
HOMEPAGE="https://kraftkit.sh"

if [[ ${PV} = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/unikraft/kraftkit"
	KEYWORDS=""
else
	SRC_URI="https://github.com/unikraft/kraftkit/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
		http://localhost:8080/${P}-vendor.tar.xz"
	KEYWORDS="~amd64"
fi

LICENSE=""
SLOT="0"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_unpack() {
	default

	if [[ ${PV} = *9999* ]]; then
		git-r3_src_unpack
		go-module_live_vendor
	fi
}

src_compile() {
	emake kraft WORKDIR=${S} DISTDIR=${S}/dist DOCKER= VERSION=${PV} GIT_SHA=${EGIT_COMMIT}
	emake man WORKDIR=${S} DISTDIR=${S}/dist DOCKER=
}

src_install() {
	dobin dist/kraft
	dobin scripts/kraftld

	gzip -d docs/man/* && doman docs/man/*
}
