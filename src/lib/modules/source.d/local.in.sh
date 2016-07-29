#!/bin/bash
# source handler for local files
[ -n "$PKG_DIFF_SOURCE_LOCAL" ] && return
PKG_DIFF_SOURCE_LOCAL=1

source @libdir@/message

source_get()
{
    if [ ! -r "$1" ] ; then
        # we cant read source return
        return 1
    fi

    if [ $# -eq 1  ] ; then
        # ok we only got one source
        # test if its a dir
        if [ ! -d $1  ] ; then
            # hm its just one file something is wrong
            warn 'got just one source something is wrong'
        fi
    fi

    # assume 0 if not set
    pkg_diff_local_source_counter=${pkg_diff_local_source_counter:=0}

    mkdir "$SOURCE_DIR"/local${pkg_diff_local_source_counter}

    while [ ! $# = 0 ] ; do
        ln -s $1 "$SOURCE_DIR"/local${pkg_diff_local_source_counter}/.
        shift
    done

    ((pkg_diff_local_source_counter++))
}


source_update()
{
    # just return we cant update the source
    return 0
}

