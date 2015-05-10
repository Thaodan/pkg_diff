#!/bin/bash

collect_source()
{
    (
        verbose 'opening pkgbuild'
        # parse pkgbuild for a files that belong to the pkg that are local
        . $pkgbuild
        
        if [ "$source_i686" ] ; then
            source+=($source_i686)
        fi
        verbose "found \$source_i686${source_i686+ not}"
        
        if [ "$source_x86_64" ] ; then
            source+=($source_x86_64)
        fi
        verbose "found \$source_x86_64${source_x86_64+ not}"
        
        if [ $install ] ; then
            source+=($install)
        fi
        
        verbose "install file found${install+ not}"
        
        if [ $changelog ] ; then
            source+=($changelog)
        fi
        
        verbose "changelog file found${changelog+ not}"
        
        echo "source=( ${source[*]} )" > tmp_source.sh
        
    )
    . $PWD/tmp_source.sh
    rm $PWD/tmp_source.sh
}
