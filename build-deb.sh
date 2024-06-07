#!/bin/bash

DIST=librga-1.10.1
#DIST=librga-1.9.3

cd $DIST || exit 1
debuild -b -us -uc -tc
