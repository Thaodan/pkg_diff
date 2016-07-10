#!/bin/sh
[ -n "$PKG_DIFF_CACHE" ] && return
PKG_DIFF_CACHE=1
# global vars:
# keep: if set keep new sources
# TARGET_DIR: dir of all stuff

# init target dir
# if not already set
if [ ! $TARGET_DIR ] ; then
    # assume pwd is writeable
    TARGET_DIR=$PWD
fi


# FIXME sh -x ?
mkdir -p $TARGET_DIR

clean_up()
{
    if [ ! $keep ] ; then
        rm -rf $TARGET_DIR
    fi
}
