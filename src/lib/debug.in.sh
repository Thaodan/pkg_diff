#!/bin/sh
# global vars:
# verbose: be verbose if set
# chatty: just be chatty but didn't talk to much
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
