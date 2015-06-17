#!/bin/sh
#\\options_begin
# options:
# -D : debug enable debug mode
# -V : enable verbose mode
# -m : be chatty
#\\options_end
args=DVm
arg_func=option_debug
option_debug()
{
    case $arg in
        D) debug=true;;
        V) verbose=true;;
        m) msg=true;;
    esac
}
