#!/bin/bash

#---
rm -rf docs
rm -rf _build

#---
make html

#---
cp -r _build/html docs