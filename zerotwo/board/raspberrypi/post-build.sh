#!/bin/sh

set -u
set -e

# Add a console on tty1
if [ -e ${TARGET_DIR}/etc/inittab ]; then
    grep -qE '^tty1::' ${TARGET_DIR}/etc/inittab || \
	sed -i '/GENERIC_SERIAL/a\
tty1::respawn:/sbin/getty -L  tty1 0 vt100 # HDMI console' ${TARGET_DIR}/etc/inittab
fi

if [ ! -e ${TARGET_DIR}/etc/systemd/system/getty.target.wants/getty@ttyGS0.service ]; then
	mkdir -p ${TARGET_DIR}/etc/systemd/system/getty.target.wants/
	ln -s /lib/systemd/system/getty@.service ${TARGET_DIR}/etc/systemd/system/getty.target.wants/getty@ttyGS0.service
fi
