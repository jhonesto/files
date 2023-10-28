#!/bin/bash

#generate template for manifest

cat << EOF > MANIFEST.MF
Manifest-Version: 1.0
Main-Class: $MAIN_CLASS
Rsrc-Class-Path: ./ $RSRC_CLASS_PATH
Rsrc-Main-Class: $RSRC_MAIN_CLASS
Class-Path: $CLASS_PATH
EOF
