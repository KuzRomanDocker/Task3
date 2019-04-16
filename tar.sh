#!/bin/bash

when=$(date '+%Y-%m-%d')

tar -czvf $when.tar.gz [0-9][0-9][0-9][0-9]* | while read I ; do rm -rf "$I" ; done
