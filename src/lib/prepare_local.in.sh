#!/bin/bash
if [ ! $cache ] ; then
    cd $target_dir_local
    collect_source
    source+=(${pkgbuild##*/})
    for src in ${source[*]} ; do
        if [ $(get_protocol "$src") = local ] ; then
            ln -fs $confdir/$src $src
        else
            verbose "$src is not local skipping"
        fi
    done
    unset src
fi
