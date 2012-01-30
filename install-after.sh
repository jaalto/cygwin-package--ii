#!/bin/sh
#
# install-after.sh -- Custom installation
#
# The script will receive one argument: relative path to
# installation root directory. Script is called like:
#
#    $ install-after.sh .inst
#
# This script is run after [install] command.

Cmd()
{
    echo "$@"
    [ "$test" ] && return
    "$@"
}

Main()
{
    root=${1:-".inst"}

    if [ "$root"  ] && [ -d $root ]; then

        root=$(echo $root | sed 's,/$,,')  # Delete trailing slash
	docdir=$(cd $root/usr/share/doc/ii* && pwd)

	[ "$docdir" ] || return 0

        echo ">> copying example script"
        Cmd install -m 755 *.sh $docdir/

    fi
}

Main "$@"

# End of file
