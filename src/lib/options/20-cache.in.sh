#!/bin/bash
# e use existing cache
# k keep cache
args=ek
arg_func=option_cache
option_cache()
{
    case $arg in
        e) cache=t;;
        k) keep=t ;;
    esac
}
help_msg=" 
-e 
"