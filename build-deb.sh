#!/bin/bash

DIST=librga-1.10.1

cd $DIST || exit 1
debuild -b -us -uc -tc
