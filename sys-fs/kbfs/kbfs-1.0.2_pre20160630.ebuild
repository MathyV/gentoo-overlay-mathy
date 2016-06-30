# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit eutils

COMMIT="7e7a4c732c61c7961aa8de1127bfb8d2b17d57a2"

DESCRIPTION="Keybase Filesystem (KBFS)"
HOMEPAGE="https://keybase.io/"
SRC_URI="https://github.com/keybase/kbfs/archive/${COMMIT}.zip -> ${P}.zip"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	>=dev-lang/go-1.6:0
	>=app-crypt/keybase-1.0.17_pre20160630"

S="${WORKDIR}/src/github.com/keybase/kbfs"

src_unpack() {
	unpack "${P}.zip"
	mkdir -p "$(dirname "${S}")" || die
	mv "kbfs-${COMMIT}" "${S}" || die
}

src_compile() {
	GOPATH="${WORKDIR}:${S}/vendor" \
	go build -v -x \
	-tags production \
	-o "${T}/kbfsfuse" \
	github.com/keybase/kbfs/kbfsfuse || die
}

src_install() {
	dobin "${T}/kbfsfuse"
}

pkg_postinst() {
	elog "You will need to mount the keybase filesystem as a user that has the keybase"
	elog "daemon running. One example to do this:"
	elog ""
	elog "  # mkdir ~/keybase"
	elog "  # kbfsfuse ~/keybase"
}
