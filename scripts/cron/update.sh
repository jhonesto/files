#!/bin/bash

if dnf update -y
then
	CWD=$PWD
	exec $CWD/checksum.sh /usr/share/applications/brave-browser.desktop /root/brave-browser.desktop 
    exec $CWD/checksum.sh /usr/share/applications/chromium-browser.desktop /root/chromium-browser.desktop
fi
