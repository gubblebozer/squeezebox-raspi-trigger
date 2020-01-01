#!/bin/bash
#
# Raspberry PI GPIO "trigger" script
# Mike Andrews
# 30 December 2019
#
# Usage: gpio-trigger.sh <on|off>


# Define which GPIO pin you're controlling here:
PIN="14"
LOGFILE=/var/log/squeezeboxserver/gpio-trigger.log

d=$(date --iso-8601=seconds)
echo "$d $@" >> $LOGFILE

# export pin to userspace, set as output
if [ ! -e /sys/class/gpio/gpio${PIN}/value ]; then
    echo "$PIN" > /sys/class/gpio/export || echo "pin ${PIN} already exported, strange"
fi
echo "out" > /sys/class/gpio/gpio${PIN}/direction

if [ "$1" == "on" ]; then
    echo "1" > /sys/class/gpio/gpio${PIN}/value
elif [ "$1" == "off" ]; then
    echo "0" > /sys/class/gpio/gpio${PIN}/value
else
    echo "$d invalid argument" >> $LOGFILE
    >&2 echo "invalid argument"
    exit 1
fi
