#!/bin/env bash

# setting environment variables
date=$1 # MMDD format
hour=$2 # HH format
ampm=$3 # AM/PM
game_type=$4 # 0 selects the first game type, 1 the second, 2 the third, etc.

# Shifting dealer name indexes according to selected game type.
declare -i shift=$((2*$game_type))
declare -i fname_pos=$((3 + $shift))
declare -i lname_pos=$((4 + $shift))

# Finding dealer log files with the correct date, searching for the correct time, then parsing for the time, first name, and last name of the dealer.
echo 'DEALER:'
egrep "$hour(:[0-9]{2}){2} $ampm" `find Dealer_Analysis -type f -name $date*` | awk -v a=$fname_pos -v b=$lname_pos -F' ' '{print $1,$2,$a,$b}'

# Finding player log files with the correct date and searching for the correct time.
echo 'PLAYERS:'
egrep "$hour(:[0-9]{2}){2} $ampm" `find Player_Analysis -type f -name $date*`
echo '-------'
