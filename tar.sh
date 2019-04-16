#!/bin/bash

tar -czvf arch.tar.gz [0-9][0-9][0-9][0-9]* | while read I ; do rmdir "$I" ; done
