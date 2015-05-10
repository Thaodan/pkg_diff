#!/bin/bash
download()
{
    local curl_options
    if [ ! $msg ] ; then
        curl_options=--silent
    else
        printf "$1:"
        curl_options=--progress-bar
    fi
    case $source_url in
        *%s*)
            local source_url=$(echo $source_url | sed "s|%s|$1|")
            curl $curl_options $source_url -o $1
        ;;
        *)
            curl --remote-name $source_url/$1 -o $1
            ;;
    esac
}

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
if [ ! $cache ] ; then
    # go to remote source dir
    cd $target_dir_remote
    msg 'getting sources'
    verbose 'first pkgbuild'
    download ${pkgbuild##*/}
    collect_source
    verbose 'then download all other sources'
    for src in ${source[*]} ; do
        if [ $(get_protocol "$src") = local ] ; then
            download $src || \
                die "error while loading $src"
        else
            verbose "$src is not local skipping"
        fi
    done
    unset src
else
    msg 'warning using existing files'
fi
