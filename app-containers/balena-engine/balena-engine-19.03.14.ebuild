# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit bash-completion-r1 golang-base linux-info systemd udev

DESCRIPTION="Moby-based Container Engine for Embedded, IoT, and Edge uses"
HOMEPAGE="https://balena.io/engine"

EGO_PN="github.com/docker/docker" # this is required for go to work
DOCKER_GITCOMMIT=811fd3a185f23dfd2f856a8890c710554fc61d91
SRC_URI="https://github.com/balena-os/balena-engine/archive/v${PV}.tar.gz"
[ "$DOCKER_GITCOMMIT" ] || die "DOCKER_GITCOMMIT must be added manually for each bump!"
# inherit golang-vcs-snapshot

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~x86"
IUSE="apparmor aufs bash-completion +buildkit cri +container-init hardened seccomp selinux systemd static vim-syntax"

PATCHES=(
	"${FILESDIR}/libseccomp-golang-091.patch"
	"${FILESDIR}/cli-product-name.patch"
)

BDEPEND="
	>=dev-lang/go-1.13.12
	virtual/pkgconfig
"

DEPEND="
	static? (
		apparmor? ( sys-libs/libapparmor[static-libs(+)] )
		seccomp? ( >=sys-libs/libseccomp-2.2.1[static-libs(+)] )
		systemd? ( sys-apps/systemd[static-libs(+)] )
	)
"

RDEPEND="
	apparmor? ( sys-libs/libapparmor )
	seccomp? ( >=sys-libs/libseccomp-2.2.1 )
	systemd? ( sys-apps/systemd )
	!sys-apps/systemd[-cgroup-hybrid(+)]
	>=net-firewall/iptables-1.4
	sys-process/procps
	container-init? ( >=sys-process/tini-0.18.0[static] )
"

RESTRICT="installsources strip"

# see "contrib/check-config.sh" from upstream's sources
CONFIG_CHECK="
	~NAMESPACES ~NET_NS ~PID_NS ~IPC_NS ~UTS_NS
	~CGROUPS ~CGROUP_CPUACCT ~CGROUP_DEVICE ~CGROUP_FREEZER ~CGROUP_SCHED ~CPUSETS ~MEMCG
	~KEYS
	~VETH ~BRIDGE ~BRIDGE_NETFILTER
	~IP_NF_FILTER ~IP_NF_TARGET_MASQUERADE
	~NETFILTER_NETLINK ~NETFILTER_XT_MATCH_ADDRTYPE ~NETFILTER_XT_MATCH_CONNTRACK ~NETFILTER_XT_MATCH_IPVS
	~IP_NF_NAT ~NF_NAT
	~POSIX_MQUEUE

	~USER_NS
	~SECCOMP
	~CGROUP_PIDS
	~MEMCG_SWAP

	~BLK_CGROUP ~BLK_DEV_THROTTLING
	~CGROUP_PERF
	~CGROUP_HUGETLB
	~NET_CLS_CGROUP
	~CFS_BANDWIDTH ~FAIR_GROUP_SCHED ~RT_GROUP_SCHED
	~IP_VS ~IP_VS_PROTO_TCP ~IP_VS_PROTO_UDP ~IP_VS_NFCT ~IP_VS_RR

	~VXLAN
	~CRYPTO ~CRYPTO_AEAD ~CRYPTO_GCM ~CRYPTO_SEQIV ~CRYPTO_GHASH ~XFRM_ALGO ~XFRM_USER
	~IPVLAN
	~MACVLAN ~DUMMY

	~OVERLAY_FS ~!OVERLAY_FS_REDIRECT_DIR
	~EXT4_FS_SECURITY
	~EXT4_FS_POSIX_ACL
"

ERROR_KEYS="CONFIG_KEYS: is mandatory"
ERROR_MEMCG_SWAP="CONFIG_MEMCG_SWAP: is required if you wish to limit swap usage of containers"
ERROR_RESOURCE_COUNTERS="CONFIG_RESOURCE_COUNTERS: is optional for container statistics gathering"

ERROR_BLK_CGROUP="CONFIG_BLK_CGROUP: is optional for container statistics gathering"
ERROR_IOSCHED_CFQ="CONFIG_IOSCHED_CFQ: is optional for container statistics gathering"
ERROR_CGROUP_PERF="CONFIG_CGROUP_PERF: is optional for container statistics gathering"
ERROR_CFS_BANDWIDTH="CONFIG_CFS_BANDWIDTH: is optional for container statistics gathering"
ERROR_XFRM_ALGO="CONFIG_XFRM_ALGO: is optional for secure networks"
ERROR_XFRM_USER="CONFIG_XFRM_USER: is optional for secure networks"

pkg_setup() {
	if kernel_is lt 3 10; then
		ewarn ""
		ewarn "Using balenaEngine with kernels older than 3.10 is unstable and unsupported."
		ewarn " - http://docs.docker.com/engine/installation/binaries/#check-kernel-dependencies"
	fi

	if kernel_is le 3 18; then
		CONFIG_CHECK+="
			~RESOURCE_COUNTERS
		"
	fi

	if kernel_is le 3 13; then
		CONFIG_CHECK+="
			~NETPRIO_CGROUP
		"
	else
		CONFIG_CHECK+="
			~CGROUP_NET_PRIO
		"
	fi

	if kernel_is lt 4 5; then
		CONFIG_CHECK+="
			~MEMCG_KMEM
		"
		ERROR_MEMCG_KMEM="CONFIG_MEMCG_KMEM: is optional"
	fi

	if kernel_is lt 4 7; then
		CONFIG_CHECK+="
			~DEVPTS_MULTIPLE_INSTANCES
		"
	fi

	if kernel_is lt 5 1; then
		CONFIG_CHECK+="
			~NF_NAT_IPV4
			~IOSCHED_CFQ
			~CFQ_GROUP_IOSCHED
		"
	fi

	if kernel_is lt 5 2; then
		CONFIG_CHECK+="
			~NF_NAT_NEEDED
		"
	fi

	if kernel_is lt 5 8; then
		CONFIG_CHECK+="
			~MEMCG_SWAP_ENABLED
		"
	fi

	if use aufs; then
		CONFIG_CHECK+="
			~AUFS_FS
			~EXT4_FS_POSIX_ACL ~EXT4_FS_SECURITY
		"
		ERROR_AUFS_FS="CONFIG_AUFS_FS: is required to be set if and only if aufs-sources are used instead of aufs4/aufs3"
	fi

	linux-info_pkg_setup
}

src_compile() {
	export GOPATH="${WORKDIR}/${P}"

	# setup CFLAGS and LDFLAGS for separate build target
	# see https://github.com/tianon/docker-overlay/pull/10
	export CGO_CFLAGS="-I${ROOT}/usr/include"
	export CGO_LDFLAGS="-L${ROOT}/usr/$(get_libdir)"

	# if we're building from a tarball, we need the GITCOMMIT value
	[[ ${DOCKER_GITCOMMIT} ]] && export DOCKER_GITCOMMIT

	# let's set up some optional features :)
	export DOCKER_BUILDTAGS=''
	# we don't support devmapper and btrfs and zfs
	DOCKER_BUILDTAGS+=' no_btrfs no_devmapper no_zfs'
	DOCKER_BUILDTAGS+=' exclude_graphdriver_btrfs exclude_graphdriver_devicemapper exclude_graphdriver_overlay exclude_graphdriver_zfs'
	# we don't support disk quota
	DOCKER_BUILDTAGS+=' exclude_disk_quota'

	if ! use aufs; then
		DOCKER_BUILDTAGS+=" exclude_graphdriver_aufs"
	fi

	for tag in apparmor seccomp selinux; do
		if use $tag; then
			DOCKER_BUILDTAGS+=" $tag"
		fi
	done

	if ! use buildkit; then
		DOCKER_BUILDTAGS+=" no_buildkit"
	fi

	if ! use cri; then
		DOCKER_BUILDTAGS+=" no_cri"
	fi

	if use hardened; then
		sed -i "s/EXTLDFLAGS_STATIC='/&-fno-PIC /" hack/make.sh || die
		grep -q -- '-fno-PIC' hack/make.sh || die 'hardened sed failed'
		sed  "s/LDFLAGS_STATIC_DOCKER='/&-extldflags -fno-PIC /" \
			-i hack/make/dynbinary-daemon || die
		grep -q -- '-fno-PIC' hack/make/dynbinary-daemon || die 'hardened sed failed'
	fi

	# setup some product stuff
	export DOCKER_LDFLAGS='-X github.com/docker/docker/dockerversion.ProductName=balenaEngine'

	# let's not worry about GOPATH :)
	export AUTO_GOPATH=1
	export VERSION="$(cat ./VERSION)"
	if ! use static; then
		./hack/make.sh dynbinary-balena || die 'make dynbinary failed'
	else
		./hack/make.sh binary-balena || die 'make binary failed'
	fi
}

src_install() {
	dosym balena-engine /usr/bin/balena # cli
	dosym balena-engine /usr/bin/balenad
	dosym balena-engine /usr/bin/balena-engine-daemon
	dosym balena-engine /usr/bin/balena-engine-containerd
	dosym balena-engine /usr/bin/balena-engine-containerd-shim
	dosym balena-engine /usr/bin/balena-engine-containerd-ctr
	dosym balena-engine /usr/bin/balena-engine-runc
	dosym balena-engine /usr/bin/balena-engine-proxy
	use container-init && dosym tini /usr/bin/balena-engine-init

	if ! use static; then
		newbin bundles/dynbinary-balena/balena-engine-${PV} balena-engine
	else
		newbin bundles/binary-balena/balena-engine-${PV} balena-engine
	fi

	newinitd contrib/init/openrc/balena-engine.initd balena-engine
	newconfd contrib/init/openrc/balena-engine.confd balena-engine

	use systemd && systemd_dounit contrib/init/systemd/balena-engine.{service,socket}

	udev_newrules contrib/udev/*.rules 80-balena-engine

	dodoc AUTHORS CONTRIBUTING.md CHANGELOG.md NOTICE README.md
	dodoc -r docs/api
	dodoc docs/getting-started.md

	if use vim-syntax; then
		insinto /usr/share/vim/vimfiles
		doins -r contrib/syntax/vim/ftdetect
		doins -r contrib/syntax/vim/syntax
	fi

	# TODO(robertgzr): check contrib/*

	if use bash-completion; then
		pushd vendor/github.com/docker/cli || die
		sed -i 's@dockerd\?\.exe@@g' contrib/completion/bash/docker || die
		dobashcomp contrib/completion/bash/*
		bashcomp_alias docker balena balenad balena-engine
		insinto /usr/share/fish/vendor_completions.d/
		doins contrib/completion/fish/docker.fish
		insinto /usr/share/zsh/site-functions
		doins contrib/completion/zsh/_*
		popd || die # cli
	fi
}
