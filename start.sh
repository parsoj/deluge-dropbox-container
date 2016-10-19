#! /bin/sh

rm -f /config/deluged.pid

deluged -d -c /config -L info -l /config/deluged.log &
deluge-web -c /config &

/root/.dropbox-dist/dropboxd &

sleep 30

ps -e

wait


