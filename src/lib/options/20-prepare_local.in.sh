# -*- sh -*-
# -L skip local only sources 
args=L
arg_func=option_prepare_local
option_prepare_local()
{
    case $arg in
        L) skip_local_only_sources=t;;
    esac
}
