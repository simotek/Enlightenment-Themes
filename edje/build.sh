#!/bin/sh
rm -f dark.edj
edje_cc -fastcomp -id ./img -sd ./snd -fd ./fnt dark.edc dark.edj
