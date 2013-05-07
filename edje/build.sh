#!/bin/sh
rm -f dark.edj; edje_cc -fastcomp -id ./img -sd ./snd dark.edc dark.edj
