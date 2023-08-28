#!/bin/bash

if dnf update -y
then
    CWD=/root/prod
	exec $CWD/cron/checksum.sh /usr/share/applications/brave-browser.desktop $CWD/brave-browser.desktop
    exec $CWD/cron/checksum.sh /usr/share/applications/chromium-browser.desktop $CWD/chromium-browser.desktop
fi
