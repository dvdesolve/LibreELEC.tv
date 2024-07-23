# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="nut"
PKG_VERSION="2.8.2"
PKG_REV="100"
PKG_SHA256="e4b4b0cbe7dd39ba9097be7f7d787bb2fffbe35df64dff53b5fe393d659c597d"
PKG_ARCH="any"
PKG_LICENSE="GPLv2+"
PKG_SITE="https://networkupstools.org"
PKG_URL="https://github.com/networkupstools/nut/releases/download/v${PKG_VERSION}/nut-${PKG_VERSION}.tar.gz"
PKG_MAINTAINER="Viktor Drobot (linux776 [at] gmail.com) (dvdesolve)"
PKG_DEPENDS_TARGET="toolchain glibc libtool libusb-compat systemd"
PKG_SECTION="service"
PKG_LONGDESC="A collection of programs which provide a common interface for monitoring and administering UPS, PDU and SCD hardware"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="Network UPS Tools (NUT)"
PKG_ADDON_TYPE="xbmc.service"

PKG_TOOLCHAIN="autotools"
PKG_BUILD_FLAGS="-sysroot"

configure_package() {
  PKG_CONFIGURE_OPTS_TARGET="--prefix=/storage/.kodi/addons/${PKG_ADDON_ID} \
                            --exec-prefix=/storage/.kodi/addons/${PKG_ADDON_ID} \
                            --bindir=/storage/.kodi/addons/${PKG_ADDON_ID}/bin \
                            --sbindir=/storage/.kodi/addons/${PKG_ADDON_ID}/bin \
                            --libdir=/storage/.kodi/addons/${PKG_ADDON_ID}/lib \
                            --libexecdir=/storage/.kodi/addons/${PKG_ADDON_ID}/lib \
                            --sysconfdir=/storage/.kodi/userdata/addon_data/${PKG_ADDON_ID} \
                            --datadir=/storage/.kodi/userdata/addon_data/${PKG_ADDON_ID}/share \
                            --datarootdir=/storage/.kodi/userdata/addon_data/${PKG_ADDON_ID}/share \
                            --with-sysroot=${SYSROOT_PREFIX} \
                            --disable-static \
                            --with-user=root \
                            --with-group=root \
                            --with-altpidpath=/run/nut \
                            --with-drvpath=/storage/.kodi/addons/${PKG_ADDON_ID}/lib \
                            --with-pidpath=/run/nut \
                            --with-statepath=/run/nut \
                            --with-systemdsystemunitdir=/storage/.kodi/addons/${PKG_ADDON_ID}/lib/systemd/system \
                            --with-udev-dir=/storage/.kodi/addons/${PKG_ADDON_ID}/lib/udev \
                            --with-usb \
                            --with-serial \
                            --with-libltdl \
                            --without-cgi \
                            --without-dev \
                            --without-doc \
                            --without-neon \
                            --without-openssl \
                            --without-ssl \
                            --without-nss \
                            --without-modbus \
                            --without-snmp \
                            --without-avahi \
                            --without-gpio \
                            --without-ipmi \
                            --without-freeipmi \
                            --without-powerman \
                            --without-macosx_ups \
                            --without-nut_monitor \
                            --without-pynut \
                            --without-wrap"
}

make_target() {
  make
}

makeinstall_target() {
  make install DESTDIR="${INSTALL}"
}

addon() {
  mkdir -p ${ADDON_BUILD}/${PKG_ADDON_ID}

  cp -r ${PKG_INSTALL}/storage/.kodi/addons/${PKG_ADDON_ID}/bin ${PKG_INSTALL}/storage/.kodi/addons/${PKG_ADDON_ID}/lib ${PKG_INSTALL}/storage/.kodi/userdata/addon_data/${PKG_ADDON_ID}/share ${ADDON_BUILD}/${PKG_ADDON_ID}/
  cp ${PKG_INSTALL}/storage/.kodi/userdata/addon_data/${PKG_ADDON_ID}/*.sample ${ADDON_BUILD}/${PKG_ADDON_ID}/share/
}
