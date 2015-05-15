#!/bin/bash

in_array()
#  usage : in_array( $needle, $haystack )
# return : 0 - found
#          1 - not found
# taken from arch linux makepkg
{
    
        local needle=$1; shift
        local item
        for item in "$@"; do
                [[ $item = "$needle" ]] && return 0 # Found
        done
        return 1 # Not Found
}


if [ ! $cache ] ; then
    if [ $skip_local_only_sources ] ; then
        msg 'warning skipping sources that are not in origin'
    fi
    cd $target_dir_local
    collect_source
    source+=(${pkgbuild##*/})
    for src in ${source[*]} ; do
        if [ $(get_protocol "$src") = local ] ; then
            if [ $skip_local_only_sources ] ; then
                if  in_array "$src" "${source_remote[@]}" ; then
                    ln -fs $confdir/$src $src
                else
                    verbose "$src is local but not in origin,skipping"
                fi
            else
                ln -fs $confdir/$src $src
            fi
        else
            verbose "$src is not local skipping"
        fi
    done
    unset src
fi
