#!/bin/bash
# A shell script to read file line by line
 
filename="filelist"
 
while read line
do
  find /run/media/risow/SlackDVD/slackware64/ -name "\$line" -exec installpkg --terse --root /mnt {} \+
done < \$filename
