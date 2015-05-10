#!/bin/sh
# options:
# -P        use pager
# -C        colored output
# -d  <arg> diff args
# -l  <arg> less args
for file in @libdir@/options/* ; do
    . $file
    # warn if no arg or arc_func given
    if [ ! $args ] ; then
	warn 'No $args set for $file'
    else
	real_args=${real_args}${args}
    fi
    if [ ! $arg_func ] ; then
	warn 'No arg func given'
    else
	arg_funcs=${arg_funcs}:${arg_func}
    fi
done
# arg func parsing done
# cleaning up
unset args
unset arg_func

# parse input for given options and enable given stuff
while getopts $real_args arg ; do
    old_IFS=$IFS
    IFS=:
    for arg_func in $arg_funcs ; do
        IFS=$old_IFS
	$arg_func
        IFS=:
    done
    IFS=$old_IFS
done
