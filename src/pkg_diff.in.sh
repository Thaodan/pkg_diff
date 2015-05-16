#!/bin/bash
appname=${0##*/}
. @libdir@/debug
. @libdir@/parse_options
. @libdir@/conf
. @libdir@/cache
. @libdir@/source
. @libdir@/download
. @libdir@/prepare_local
. @libdir@/diff
clean_up
