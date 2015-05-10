#!/bin/sh
# if conf file is not set use $PWD/.pkg_diff.conf
if [ ! $conf_file ] ; then
    conf_file="$PWD/.pkg_diff.conf"
fi

if [ ! -e $conf_file ] ; then
    die 'need conf file'
fi

. $conf_file || die 'error while loading conf file'
# if pkgbuild is not set use from pwd
if [ ! $pkgbuild ] ; then
    pkgbuild=$PWD/PKGBUILD
fi

if [ ! $source_url ] ; then
    die 'need source_url'
fi

confdir=$PWD
