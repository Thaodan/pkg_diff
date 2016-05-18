# -*- sh -*-
#help_begin
# -h,-H show this help message
#help_end
args=hH
arg_func=arg_help
arg_help()
{
    case $arg in
        h) __display_help ;;
    esac
}


__display_help()
{
    cat <<EOF
$appname - help
EOF
    __parse_help
    exit
}


__parse_help()
{
    local file 
    for file in @libdir@/options/*  ; do
        grep -Pzo "#help_begin[\s\S]*?#help_end" $file | \
             sed -e 's/^#//g' -e '/help_.*/d'
    done
}

