#!/bin/sh
diff_args='-ruN'
if [ $color ] ; then
    diff=colordiff
    less_args=${less_args}-R
else
    diff=diff
fi

$diff $diff_args $target_dir_local $target_dir_remote 
