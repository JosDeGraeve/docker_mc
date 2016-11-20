#!/bin/bash

set -ex

cd /srv/minecraft

for file in libraries ${server_jar_list}; do
    if [ ! -e $file ]; then
        ln -s ../../opt/minecraft/$file .
    fi
done

case "$1" in
    --)
        shift
        exec /usr/bin/java -Xmx1024M -Xms1024M -jar /srv/minecraft/${server_jar} "$@"
        ;;
   -*)
        exec /usr/bin/java -Xmx1024M -Xms1024M -jar /srv/minecraft/${server_jar} "$@"
        ;;
    *)
        exec "$@"
esac

exit 1
