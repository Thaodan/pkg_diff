#!/bin/sh
# options:
# -P        use pager
# -C        colored output
# -d  <arg> diff args
# -l  <arg> less args 
args=sPCd:l:
arg_func=option_diff
option_diff()
{
    case $arg in
	P) pager=true ;;
	C) color=true ;;
	d) diff_args="$OPTARG";;
	l) less_args="$OPTARG" ;;
    esac
}
