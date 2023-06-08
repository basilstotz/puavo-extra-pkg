#!/bin/sh


if test -z "$(which waydroid)"; then
    echo "error: waydroid not installed"
    exit 1
fi

tempdir=$(mktemp -d /tmp/waydroid.XXXXXX)

mkdir -p /var/lib/waydroid
mount --bind "$tempdir" /var/lib/waydroid

waydroid init

tar --mtime='2000-01-01 00:00:00 +00:00' \
        -C /var/lib/ -c \
        -f - waydroid | gzip -n > waydroid.tgz

umount /var/lib/waydroid
rm -rf /var/lib/waydroid

rm -r "$tempdir"

chown --reference ..  waydroid.tgz

