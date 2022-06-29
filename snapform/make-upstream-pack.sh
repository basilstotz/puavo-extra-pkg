#!/bin/sh


BIN=$1
HIER=$(pwd)

mkdir -p snapform

sh $BIN -q -dir $(realpath snapform)
sed -i snapform/Snapform\ Viewer.desktop -e "s@$HIER@/opt@g"
tar -czf snapform.tgz snapform
scp snapform.tgz amxach@www.amxa.ch:public_html/debian/tars/.

rm -r snapform
rm snapform.tgz

