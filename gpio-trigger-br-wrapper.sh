#!/bin/bash
#
# Raspberry PI GPIO trigger wrapper script
# Mike Andrews
# 30 December 2019
#
# Accepts arguments as a stand-in for the X10 Bottlerocket "br" utility.
# Translates any variation of "ON" args to "gpio-trigger.sh on", and any
# variation of "OFF" to "gpio-trigger.sh off".

set -e

for arg; do
    if [ "$arg" == "-n" ] || [ "$arg" == "-N" ] || [ "$arg" == "--on" ] || [ "$arg" == "--ON" ]; then
        /usr/local/bin/gpio-trigger.sh on
        exit 0
    fi
    if [ "$arg" == "-f" ] || [ "$arg" == "-F" ] || [ "$arg" == "--off" ] || [ "$arg" == "--OFF" ]; then
        /usr/local/bin/gpio-trigger.sh off
        exit 0
    fi
done

exit 1
