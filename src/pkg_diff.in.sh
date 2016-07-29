#!/bin/bash
appname=${0##*/}
ver=@VER@
source @libdir@/parse_options
source @libdir@/modules/config
source @libdir@/modules/cache
source @libdir@/modules/source
source @libdir@/modules/diff
clean_up
