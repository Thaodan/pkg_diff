#!/bin/sh
# global vars:
# keep: if set keep new sources
# verbose: be verbose if set
# chatty: just be chatty but didn't talk to much
clean_up()
{
    if [ ! $keep ] ; then
        rm -rf $target_dir_local
        rm -rf $target_dir_remote
    fi
}
verbose()
{
    if [ $verbose ] ; then
        echo $@ >2&
    fi
}
msg()
{
    if [ $chatty ] ; then
        echo $@;
    fi
}
warn()
{
    echo $@ >2&
}

error()
{
    echo $@ >&2
}

die()
{
    error $@
    clean_up
    exit 1
}
