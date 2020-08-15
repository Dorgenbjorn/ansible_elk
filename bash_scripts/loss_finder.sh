#!/bin/env bash

egrep '\-[$]' `find Player_Analysis -type f -regextype sed -regex '.*/[0-9]\{4\}.*'`
