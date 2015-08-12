# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit toolchain-funcs

DESCRIPTION="android debug bridge"
HOMEPAGE="android.googlesource.com"

COMMIT="5b3aa21bc70d42b3fcb1764a1be04ab8db5ebfb9"
SRC_URI="https://android.googlesource.com/platform/system/core.git/+archive/${COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="sys-libs/zlib
	dev-libs/openssl"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${PN}"

src_compile(){
	cp ${FILESDIR}/Makefile Makefile
	emake
}

src_install(){
	einstall DESTDIR=${D}
}
