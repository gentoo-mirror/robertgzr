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

_S6RC_RC_DIR=${S6RC_DIR:-/etc/s6-rc/src}

# @FUNCTION: s6rc_doservice
# @USAGE: <service-dir> [<new-name>]
# @DESCRIPTION:
# Install a s6 service into $s6rc_RC_DIR. Uses newins, thus it is fatal.
s6rc_doservice() {
	debug-print-function ${FUNCNAME} "${@}"

    test -d "$1" || eerror "${FUNCNAME}: argument needs to be a directory"
    test -f "$1/run" || eerror "${FUNCNAME}: service directory needs to contain a \"run\" file"
    test -f "$1/type" || eerror "${FUNCNAME}: service directory needs to contain a \"type\" file"

	(
		insopts -m 0755
		insinto "$_S6RC_RC_DIR"/"${2:-$PN}"
        doins -r "${1}"/*
	)
}

fi
