#!/bin/sh
# global vars:
# keep: if set keep new sources

# init target dir
if [ ! $target_dir ] ; then
    target_dir=$PWD
fi

target_dir_remote=$PWD/${pkgname}.orig
target_dir_local=$PWD/${pkgname}.local

mkdir -p $target_dir_local \
      $target_dir_remote


clean_up()
{
    if [ ! $keep ] ; then
        rm -rf $target_dir_local
        rm -rf $target_dir_remote
    fi
}
