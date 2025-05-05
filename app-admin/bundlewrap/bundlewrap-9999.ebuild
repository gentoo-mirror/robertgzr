# Copyright 2024 Robert Günzler
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )
inherit distutils-r1

DESCRIPTION="Config management with Python"
HOMEPAGE="
	https://pypi.org/project/bundlewrap/
	https://github.com/bundlewrap/bundlewrap
	https://bundlewrap.org
"

if [[ ${PV} = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/bundlewrap/bundlewrap"
else
	SRC_URI="https://github.com/bundlewrap/bundlewrap/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"
	# SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"
	KEYWORDS="~amd64"
fi

LICENSE="GPL-3"
SLOT="0"
IUSE="+man"

DEPEND="
	dev-python/cryptography[${PYTHON_USEDEP}]
	dev-python/passlib[${PYTHON_USEDEP}]
	dev-python/pyyaml[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/tomlkit[${PYTHON_USEDEP}]
	dev-python/jinja2[${PYTHON_USEDEP}]
	dev-python/mako[${PYTHON_USEDEP}]
	>=dev-python/librouteros-3.0.0[${PYTHON_USEDEP}]
	man? (
		|| ( app-text/pandoc app-text/pandoc-bin )
	)
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_compile() {
	default
	distutils-r1_src_compile

	if use man; then
		pages=(
			bw-repo.7
			bw-repo-nodes.5
			bw-repo-groups.5
			bw-bundle-bundle.5
			bw-bundle-items.5
			bw-bundle-metadata.5
			bw-items.7
		)

		cat > ${T}/man_after.md <<-EOF || die
		# AUTHORS
		$(grep -vE -e '^#' -e '^$' ${S}/AUTHORS | sed -e 's,$,  ,')

		# SEE ALSO
		$(sed -e 's,\.\([0-9]\),(\1),g' <<<${pages[@]})
		EOF

		pandoc -s --to man \
			-M title="bw-repo(7) version ${PV} | bundlewrap - repository" \
			-V include-after='\n\nafter?' \
			${S}/docs/content/repo/layout.md \
		    ${T}/man_after.md \
			-o bw-repo.7

		pandoc -s --to man \
			-M title="bw-repo-nodes(5) version ${PV} | bundlewrap - repository - nodes.py" \
			${S}/docs/content/repo/nodes.py.md \
		    ${T}/man_after.md \
			-o bw-repo-nodes.5

		pandoc -s --to man \
			-M title="bw-repo-groups(5) version ${PV} | bundlewrap - repository - groups.py" \
			${S}/docs/content/repo/groups.py.md \
		    ${T}/man_after.md \
			-o bw-repo-groups.5

		pandoc -s --to man \
			-M title="bw-bundle-bundle(5) version ${PV} | bundlewrap - bundle - bundle.py" \
			${S}/docs/content/repo/bundle.py.md \
		    ${T}/man_after.md \
			-o bw-bundle-bundle.5

		pandoc -s --to man \
			-M title="bw-bundle-items(5) version ${PV} | bundlewrap - bundle - items.py" \
			${S}/docs/content/repo/items.py.md \
		    ${T}/man_after.md \
			-o bw-bundle-items.5

		pandoc -s --to man \
			-M title="bw-bundle-metadata(5) version ${PV} | bundlewrap - bundle - metadata.py" \
			${S}/docs/content/repo/metadata.py.md \
		    ${T}/man_after.md \
			-o bw-bundle-metadata.5

		pandoc -s --to man \
			-M title="bw-items(7) version ${PV} | bundlewrap - items" \
			${S}/docs/content/items/*.md \
		    ${T}/man_after.md \
			-o bw-items.7
	fi
}

src_install() {
	default
	distutils-r1_src_install

	if use man; then
		doman ${pages[@]}
	fi
}
