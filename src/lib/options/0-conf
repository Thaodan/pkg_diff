#!/bin/sh
# c config file
# o set raw option
args=c:o:
arg_func=option_config
option_config()
{
    case $arg in
	c) config_file=$OPTARG;;
	o) eval $OPTARG ;; #FIXME unsafe
    esac
}
