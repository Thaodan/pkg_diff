#!/bin/sh
# init target dir
if [ ! $target_dir ] ; then
    target_dir=$PWD
fi

target_dir_remote=$PWD/${pkgname}.orig
target_dir_local=$PWD/${pkgname}.local

mkdir -p $target_dir_local \
      $target_dir_remote
