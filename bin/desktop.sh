#!/bin/sh

DESKTOP="Desktop $(bspc query -D -d focused --names)"
dunstify "$DESKTOP" -t 1000
