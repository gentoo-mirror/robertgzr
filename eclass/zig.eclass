# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# @ECLASS: zig.eclass
# @MAINTAINER:
# Robert Günzler <r@gnzler.io>
# @AUTHOR:
# Robert Günzler <r@gnzler.io>
# @SUPPORTED_EAPIS: 8
# @BLURB:
# @DESCRIPTION:

case ${EAPI} in
	8) ;;
	*) die "${ECLASS}: EAPI ${EAPI:-0} not supported" ;;
esac

if [[ ! ${_ZIG_ECLASS} ]]; then
_ZIG_ECLASS=1

inherit edo

EXPORT_FUNCTIONS \
    live_src_unpack \
    src_configure \
    src_compile \
    src_install \
    src_test

EZIG_MIN="${EZIG_MIN:-0.13}"
EZIG_MAX_EXCLUSIVE="${EZIG_MAX_EXCLUSIVE:-0.14}"

ZIG_DEPS="|| ( dev-lang/zig:${EZIG_MIN} dev-lang/zig-bin:${EZIG_MIN} )"

# : copied from sys-fs/ncdu :
# Many thanks to Florian Schmaus (Flowdalic)!
# Adapted from https://github.com/gentoo/gentoo/pull/28986
# Set the EZIG environment variable.
zig-set_EZIG() {
	[[ -n ${EZIG} ]] && return

	if [[ -n ${EZIG_OVERWRITE} ]]; then
		export EZIG="${EZIG_OVERWRITE}"
		return
	fi

	local candidates candidate selected selected_ver

	candidates=$(compgen -c zig-)

	for candidate in ${candidates}; do
		if [[ ! ${candidate} =~ zig(-bin)?-([.0-9]+) ]]; then
			continue
		fi

		local ver
		if (( ${#BASH_REMATCH[@]} == 3 )); then
			ver="${BASH_REMATCH[2]}"
		else
			ver="${BASH_REMATCH[1]}"
		fi

		if [[ -n ${EZIG_EXACT_VER} ]]; then
			ver_test "${ver}" -ne "${EZIG_EXACT_VER}" && continue

			selected="${candidate}"
			selected_ver="${ver}"
			break
		fi

		if [[ -n ${EZIG_MIN} ]] \
			   && ver_test "${ver}" -lt "${EZIG_MIN}"; then
			# Candidate does not satisfy EZIG_MIN condition.
			continue
		fi

		if [[ -n ${EZIG_MAX_EXCLUSIVE} ]] \
			   && ver_test "${ver}" -ge "${EZIG_MAX_EXCLUSIVE}"; then
			# Candidate does not satisfy EZIG_MAX_EXCLUSIVE condition.
			continue
		fi

		if [[ -n ${selected_ver} ]] \
			   && ver_test "${selected_ver}" -gt "${ver}"; then
			# Candidate is older than the currently selected candidate.
			continue
		fi

		selected="${candidate}"
		selected_ver="${ver}"
	done

	if [[ -z ${selected} ]]; then
		die "Could not find (suitable) zig installation in PATH"
	fi

	export EZIG="${selected}"
	export EZIG_VER="${ver}"
}

# Invoke zig with the optionally provided arguments.
ezig() {
	zig-set_EZIG

	# Unfortunately, we cannot add more args here, since syntax is different
	# for every subcommands. Yes, even target/cpu :( f.i. :
	# -target/-mcpu for zig build-exe vs -Dtarget/-Dcpu for zig build-
	# -OReleaseSafe for zig build-exe vs -DReleaseSafe for zig build
	# (or even none, if hardcoded by upstream so choice is -Drelease=true/false)
	# Ofc we can patch this, but still...

	edo "${EZIG}" "${@}"
}

zig_live_src_unpack() {
    debug-print-function ${FUNCNAME} "$@"
    cd "${S}" || die
    ezig build --verbose --fetch --global-cache-dir "${WORKDIR}/zig-eclass/" ||
        die "Pre-fetching Zig modules failed"
}

zig_src_configure() {
    debug-print-function ${FUNCNAME} "$@"
    export ZBS_ARGS=(
        --verbose
        --verbose-cc
        --verbose-cimport
        --verbose-link
        --debug-pkg-config
		--prefix usr/
		--system "${WORKDIR}/zig-eclass/p/"
        ${zig_args[@]}
    )
}

zig_src_compile() {
    debug-print-function ${FUNCNAME} "$@"
	ezig build "${ZBS_ARGS[@]}"
}

zig_src_test() {
    debug-print-function ${FUNCNAME} "$@"
	ezig build test "${ZBS_ARGS[@]}"
}

zig_src_install() {
    debug-print-function ${FUNCNAME} "$@"
	DESTDIR="${ED}" ezig build install "${ZBS_ARGS[@]}"
}

fi
