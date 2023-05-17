# Copyright 2020-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rpm multilib

DESCRIPTION="Brother printer driver for HL-L8250CDN"
HOMEPAGE="http://support.brother.com"


SRC_URI="https://download.brother.com/welcome/dlf101036/hll8250cdnlpr-1.1.2-1.i386.rpm
	https://download.brother.com/welcome/dlf101034/hll8250cdncupswrapper-1.1.3-1.i386.rpm"

LICENSE="brother-eula"
SLOT="0"
IUSE=""
KEYWORDS="amd64"

RESTRICT="mirror strip"

DEPEND="net-print/cups"
RDEPEND="${DEPEND}"

S=${WORKDIR}

src_install() {
	has_multilib_profile && ABI=x86

	dosbin "${WORKDIR}/usr/bin/brprintconf_hll8250cdn"

	cp -r usr "${D}" || die
	cp -r opt "${D}" || die

	mkdir -p "${D}/usr/libexec/cups/filter" || die
	( cd "${D}/usr/libexec/cups/filter/" && ln -s ../../../../opt/brother/Printers/hll8250cdn/lpd/filterhll8250cdn brother_lpdwrapper_hll8250cdn ) || die

	mkdir -p "${D}/usr/share/cups/model" || die
	( cd "${D}/usr/share/cups/model" && ln -s ../../../../opt/brother/Printers/hll8250cdn/cupswrapper/brother_hll8250cdn_printer_en.ppd ) || die
}
