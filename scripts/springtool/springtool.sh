
#! /bin/sh

cd ~/springtools

export GTK_IM_MODULE="ibus"

export JAVA_HOME=$(dirname $(dirname $(readlink -f $(readlink -f $(which javac)))))

export PATH=$PATH:$JAVA_HOME/bin

export CLASSPATH=.:$JAVA_HOME/jre/lib:$JAVA_HOME/lib:$JAVA_HOME/lib/tools.jar

./SpringToolSuite4 &
