################################################################################
#      This file is part of OpenELEC - http://www.openelec.tv
#      Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
#
#  OpenELEC is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 2 of the License, or
#  (at your option) any later version.
#
#  OpenELEC is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with OpenELEC.  If not, see <http://www.gnu.org/licenses/>.
################################################################################

PKG_NAME="libaacs"
PKG_VERSION="0.9.0"
PKG_SHA256="47e0bdc9c9f0f6146ed7b4cc78ed1527a04a537012cf540cf5211e06a248bace"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://www.videolan.org/developers/libaacs.html"
PKG_URL="http://download.videolan.org/pub/videolan/libaacs/$PKG_VERSION/$PKG_NAME-$PKG_VERSION.tar.bz2"
PKG_DEPENDS_TARGET="toolchain libgcrypt"
PKG_SECTION="multimedia"
PKG_SHORTDESC="libaacs: a research project to implement the Advanced Access Content System specification."
PKG_LONGDESC="libaacs is a research project to implement the Advanced Access Content System specification. This research project provides, through an open-source library, a way to understand how the AACS works. This research project is mainly developed by an international team of developers from Doom9."
PKG_TOOLCHAIN="autotools"

PKG_CONFIGURE_OPTS_TARGET="--disable-werror \
                           --disable-extra-warnings \
                           --disable-optimizations \
                           --with-libgcrypt-prefix=$SYSROOT_PREFIX/usr \
                           --with-libgpg-error-prefix=$SYSROOT_PREFIX/usr \
                           --with-gnu-ld"

post_makeinstall_target() {
  mkdir -p $INSTALL/usr/config/aacs
    cp -P ../KEYDB.cfg $INSTALL/usr/config/aacs
}
