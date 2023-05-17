# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# @ECLASS: go.eclass
# @MAINTAINER:
# Robert Günzler <r@gnzler.io>
# @AUTHOR:
# Robert Günzler <r@gnzler.io>
# @SUPPORTED_EAPIS: 8
# @BLURB: eclass for building software written as go modules
# @DESCRIPTION:
# This eclass provides an easy way to build go modules based software.

if [[ ! ${_GO_ECLASS} ]]; then

case ${EAPI} in
	8) ;;
	*) die "${ECLASS}: EAPI ${EAPI} unsupported."
esac

_GO_ECLASS=1

# setup defaults
inherit go-module
RESTRICT="network-sandbox"

EXPORT_FUNCTIONS src_unpack src_configure src_compile src_install

EGO_STATIC=${EGO_STATIC:-}
EGO_MAIN="${EGO_MAIN:-.}"

go_src_unpack() {
    debug-print-function ${FUNCNAME} "$@"

    default

    if [[ ${PV} = *9999* ]]; then
        git-r3_src_unpack
    fi

    if [[ ! -d ${S}/vendor ]]; then
        go-module_live_vendor
    fi
}

go_src_configure() {
    debug-print-function ${FUNCNAME} "$@"

    goldflags=()
    goldflags+=(-s)
    goldflags+=(-w)
    # embed main.version by default
    goldflags+=(-X "main.version=${PV}")
    # arguments from ebuild
    goldflags+=(${egoldflags[@]})

    gotags=(
        $([ -n "$EGO_STATIC" ] && echo "static_build")

        # arguments from ebuild
        "${egotags[@]}"
    )
    gotagsargs=()
    if [ "${#gotags[@]}" -gt 0 ]; then
        gotagsargs=( -tags "${gotags[@]}" )
    fi
}

go_src_compile() {
    debug-print-function ${FUNCNAME} "$@"

    [ -n "${EGO_STATIC}" ] && local -x CGO_ENABLED=0

    for main in "${EGO_MAIN[@]}"; do
        set -- go build \
            "${gotagsargs[@]}" \
            -ldflags "$(echo "${goldflags[@]}")" \
            -trimpath \
            -o "${S}/${P}-${main}" \
            "${main}"
        echo "$@" >&2
        "$@" || die "compile failed"
    done
}

go_src_install() {
    debug-print-function ${FUNCNAME} "$@"

    for main in "${EGO_MAIN[@]}"; do
        if [[ "${main}" == "." ]]; then
            _binname="${PN}"
        else
            _binname=$(basename "${main}")
        fi
        newbin "${S}/${P}-${main}" "${_binname}"
        # dobin "${S}/${P}"
    done
}

fi
