#!/bin/bash

set -ex

cd /srv/minecraft

for file in libraries minecraft_server.1.10.2.jar; do
    if [ ! -e $file ]; then
        ln -s ../../opt/minecraft/$file .
    fi
done

case "$1" in
    --)
        shift
        exec /usr/bin/java -Xmx1024M -Xms1024M -jar /srv/minecraft/minecraft_server.1.10.2.jar "$@"
        ;;
   -*)
        exec /usr/bin/java -Xmx1024M -Xms1024M -jar /srv/minecraft/minecraft_server.1.10.2.jar "$@"
        ;;
    *)
        exec "$@"
esac

exit 1
