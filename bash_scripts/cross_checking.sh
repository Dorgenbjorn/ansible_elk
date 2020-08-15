#!/bin/bash

date=$1
hour=$2
ampm=$3
echo 'DEALER:'
egrep "$hour(:[0-9]{2}){2} $ampm" `find Dealer_Analysis -type f -name $date*` | awk -F' ' '{print $1,$2,$5,$6}'
echo 'PLAYERS:'
egrep "$hour(:[0-9]{2}){2} $ampm" `find Player_Analysis -type f -name $date*`
