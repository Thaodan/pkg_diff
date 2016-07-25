#!/bin/bash
#\\include ../../config.shh
# -*- bash -*-
[ -n "$PKG_DIFF_SOURCE" ] && return
PKG_DIFF_SOURCE=1

source @libdir@/message


# constants
SOURCEDIR=$TMPDIR/source


# taken from arch linux makepkg
# extract the protocol from a source entry - return "local" for local sources
get_protocol()
{
    local proto
    if [[ $1 = *://* ]]; then
        # strip leading filename
        proto="${1#*::}"
        printf "%s\n" "${proto%%://*}"
    elif [[ $1 = *lp:* ]]; then
        proto="${1#*::}"
        printf "%s\n" "${proto%%lp:*}"
    else
        printf "%s\n" local
    fi
}



source_url_len=${#source_url[*]}
i=0
while [ ! $i = $source_url_len ] ; do
    protocol=$(get_protocol ${source[$i]})
    if [ -e ${LIBDIR:-@libdir@}/modules/source/$protocol  ] ; then
        source  ${LIBDIR:-@libdir@}/modules/source/$protocol
        get_source ${source_url[$i]}
    else
        die "provider for protocol not found"
    fi
    ((i++))
done
