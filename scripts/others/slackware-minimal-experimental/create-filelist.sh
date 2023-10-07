
#!/bin/bash
# A shell script to read file line by line
 
filename="slackware-minimal.txt"
 
while read line
do
    # $line variable contains current line read from the file
    # display $line text on the screen or do something with it.
  find /run/media/risow/SlackDVD/slackware64/ -name "$line*.txz" -exec echo >> filelist {} \+
  
done < $filename

