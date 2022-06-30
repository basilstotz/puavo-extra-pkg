#!/bin/sh

wget $1

tar -xzf printer-brands.tar.gz .

./compile.sh

scp cups-printer-ppd.tgz amxa.ch:public_html/debian/tars/.


exit 0
