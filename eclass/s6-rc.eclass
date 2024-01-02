# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# @ECLASS: s6rc.eclass
# @MAINTAINER:
# Robert Günzler <r@gnzler.io>
# @AUTHOR:
# Robert Günzler <r@gnzler.io>
# @SUPPORTED_EAPIS: 8
# @BLURB: helper functions to install s6-rc service files
# @DESCRIPTION:
# This eclass provides a set of functions to install service files for
# sys-apps/s6-rc within ebuilds.
# @EXAMPLE:
#
# @CODE
# inherit s6rc
#
# @CODE

case ${EAPI} in
	8) ;;
	*) die "${ECLASS}: EAPI ${EAPI:-0} not supported" ;;
esac

if [[ ! ${_S6RC_ECLASS} ]]; then
_S6RC_ECLASS=1
_S6RC_DIR=${S6RC_DIR:-/etc/s6-rc/src}

EXPORT_FUNCTIONS pkg_postinst

s6-rc_pkg_postinst() {
	echo
	elog "Attention: the s6-rc eclass assumes there is a script to refresh the"
    elog "service db at $_S6RC_DIR/../reload"
	elog "You should manually trigger a refresh, if that isn't the case!"
	echo

    test -f $_S6RC_DIR/../reload || eerror "Missing service db refresh script"
    $_S6RC_DIR/../reload
}

# @FUNCTION: s6rc_doservice
# @USAGE: <service-dir> [<new-name>]
# @DESCRIPTION:
# Install a s6 service into $s6rc_RC_DIR. Uses newins, thus it is fatal.
s6-rc_doservice() {
	debug-print-function ${FUNCNAME} "${@}"

    local svc=${2:-$PN}

    test -d "$1" || eerror "${FUNCNAME}: argument needs to be a directory"
    test -f "$1/run" || eerror "${FUNCNAME}: service directory needs to contain a \"run\" file"
    test -f "$1/type" || eerror "${FUNCNAME}: service directory needs to contain a \"type\" file"

	(
		insopts -m 0755
		insinto "$_S6RC_DIR"/"${svc}"
        doins -r "${1}"/*
	)
}

# @FUNCTION: s6rc_enable
# @USAGE: [<bundle>] [<service-name>]
# @DESCRIPTION:
# Enable a s6-rc service. Without arguments the "default" bundle is used
s6-rc_enable() {
	debug-print-function ${FUNCNAME} "${@}"

    local bundle=${1:-default}
    local svc=${2:-$PN}
    local bundle_dir="$ED"/"$_S6RC_DIR"/"${bundle}"

	(
		mkdir -p "${bundle_dir}"/contents.d
        touch "${bundle_dir}"/contents.d/"${svc}"
	)
}

fi
