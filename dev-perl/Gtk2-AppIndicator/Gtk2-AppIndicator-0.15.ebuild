# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

MODULE_AUTHOR=OESTERHOL
MODULE_VERSION=0.15
inherit perl-module

DESCRIPTION="A perl binding for GTK2 AppIndicator"

SLOT="0"
KEYWORDS="amd64 x86"

RDEPEND="dev-perl/gtk2-perl
	dev-libs/libappindicator:2
"
DEPEND="${RDEPEND}"

#SRC_TEST="do"
