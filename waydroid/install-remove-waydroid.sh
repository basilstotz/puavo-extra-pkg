#!/bin/sh

if test "$1" = "install"; then 
   curl https://repo.waydro.id | sudo bash
   apt-get --yes install waydroid
else
   if test "$1" = "remove"; then 
      apt-get --yes remove waydroid
      rm /etc/apt/sources.list.d/waydroid.list
      rm /usr/share/keyrings/waydroid.gpg
   else
       echo "usage: $0 [install|remove]"
   fi
fi

exit






