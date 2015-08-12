# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit toolchain-funcs

DESCRIPTION="fastboot is a util to control android bootloader"
HOMEPAGE="android.googlesource.com"

COMMIT_FASTBOOT="5b3aa21bc70d42b3fcb1764a1be04ab8db5ebfb9"
COMMIT_EXTRAS="8e9fa76016a34ec53b83157032e38fad06af1135"
COMMIT_LIBSELINUX="6608a1875b07370733d0f93f3a52febcef3442bf"

SRC_URI="https://android.googlesource.com/platform/system/core.git/+archive/${COMMIT_FASTBOOT}.tar.gz -> ${P}.tar.gz
	https://android.googlesource.com/platform/system/extras/+archive/${COMMIT_EXTRAS}.tar.gz -> ${P}-extras.tar.gz
	https://android.googlesource.com/platform/external/libselinux/+archive/${COMMIT_LIBSELINUX}.tar.gz -> ${P}-libselinux.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="sys-libs/zlib
	dev-libs/libpcre"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${PN}"

src_unpack(){
	unpack ${P}.tar.gz

	cd ${S}
	mkdir extras
	cd extras
	unpack ${P}-extras.tar.gz

	cd ${S}
	mkdir libselinux
	cd libselinux
	unpack ${P}-libselinux.tar.gz
}

src_compile(){
	cp ${FILESDIR}/Makefile Makefile
	emake
}

src_install(){
	einstall DESTDIR=${D}
}
