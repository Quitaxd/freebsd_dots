#!/usr/bin/env bash

killall -q polybar

sleep 0.2

polybar & >/dev/null
