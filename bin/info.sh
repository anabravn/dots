#!/bin/sh

# Time in milliseconds for notifications to disappear
T=3500 

# Battery Status
PERCENT="$(cat /sys/class/power_supply/BAT0/capacity)%"
STATUS="$(cat /sys/class/power_supply/BAT0/status)"
BATT="$PERCENT, $STATUS"

# Date and Time
TIME="$(date +"%R")"
DATE="$(date +"%A %d, %B")"

# Network
STATE="$(nmcli -g GENERAL.STATE device show wlp2s0)"
CON="$(nmcli -g GENERAL.CONNECTION device show wlp2s0)"
NETWORK="$CON\n$STATE"

dunstify Time "$TIME" -t $T
sleep 0.1

dunstify Date "$DATE" -t $T
sleep 0.1

dunstify Network "$NETWORK" -t $T
sleep 0.1

dunstify Battery "$BATT" -t $T
