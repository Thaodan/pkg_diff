#!/bin/sh
#help_begin
# -D : debug enable debug mode
# -V : enable verbose mode
# -m : be chatty
#help_end
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
