# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CRATES="
arc-swap-0.4.6
async-trait-0.1.31
bitflags-1.2.1
bytes-0.5.4
cc-1.0.53
cfg-if-0.1.10
enquote-1.0.3
fnv-1.0.7
fuchsia-zircon-0.3.3
fuchsia-zircon-sys-0.3.3
getopts-0.2.21
iovec-0.1.4
itoa-0.4.5
kernel32-sys-0.2.2
lazy_static-1.4.0
libc-0.2.70
log-0.4.8
memchr-2.3.3
mio-0.6.22
mio-named-pipes-0.1.6
mio-uds-0.6.8
miow-0.2.1
miow-0.3.3
net2-0.2.34
nix-0.17.0
pam-sys-0.5.6
pin-project-lite-0.1.5
proc-macro2-1.0.12
quote-1.0.5
redox_syscall-0.1.56
rpassword-4.0.5
ryu-1.0.4
serde-1.0.110
serde_derive-1.0.110
serde_json-1.0.53
signal-hook-registry-1.2.0
slab-0.4.2
socket2-0.3.12
syn-1.0.21
thiserror-1.0.17
thiserror-impl-1.0.17
tokio-0.2.11
tokio-macros-0.2.4
unicode-width-0.1.7
unicode-xid-0.2.0
users-0.9.1
void-1.0.2
winapi-0.2.8
winapi-0.3.8
winapi-build-0.1.1
winapi-i686-pc-windows-gnu-0.4.0
winapi-x86_64-pc-windows-gnu-0.4.0
ws2_32-sys-0.2.1
"

inherit cargo pam

DESCRIPTION="greetd"
# Double check the homepage as the cargo_metadata crate
# does not provide this value so instead repository is used
HOMEPAGE="https://kl.wtf/projects/greetd"
RESTRICT="mirror"

if [ ${PV} == "9999" ] ; then
	inherit git-r3
	EGIT_REPO_URI="https://git.sr.ht/~kennylevinsen/greetd"
else
	SRC_URI="https://git.sr.ht/~kennylevinsen/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz
	$(cargo_crate_uris ${CRATES})"
	KEYWORDS="~amd64 ~ppc64"
fi

# License set may be more restrictive as OR is not respected
# use cargo-license for a more accurate license picture
LICENSE="Apache-2.0 BSD-3-Clause BSL-1.0 GPL-3.0 MIT Unlicense"
SLOT="0"
KEYWORDS="~amd64"
IUSE="debug +man systemd openrc"

BDEPEND="
	man? ( app-text/scdoc )
"

src_unpack() {
	if [[ "${PV}" == *9999* ]]; then
		git-r3_src_unpack
		cargo_live_src_unpack
	else
		cargo_src_unpack
	fi
}

src_compile() {
	cargo_src_compile

	if use man; then
		cd man || die
		scdoc < greetd-1.scd > greetd.1
		scdoc < greetd-5.scd > greetd.5
		scdoc < greetd-ipc-7.scd > greetd-ipc.7
		scdoc < agreety-1.scd > agreety.1
	fi
}

src_install() {
	mv man _man

	CARGO_INSTALL_PATH="greetd" \
	cargo_src_install

	CARGO_INSTALL_PATH="agreety" \
	cargo_src_install

	doman _man/greetd.1 _man/greetd.5
	doman _man/greetd-ipc.7
	doman _man/agreety.1

	insinto /etc/greetd
	doins config.toml

	if use systemd; then
		inherit systemd
		systemd_dounit greetd.service
	fi

	dopamd "${FILESDIR}/${PN}.pamd"
}
