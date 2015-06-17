#!/bin/bash
#help_begin
# -e use existing cache
# -k keep cache
#help_end
args=ek
arg_func=option_cache
option_cache()
{
    case $arg in
        e) cache=t;;
        k) keep=t ;;
    esac
}

