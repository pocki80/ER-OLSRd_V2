#!/bin/sh
echo "Killing running deamons..."
ps aux | grep "/config/olsrd2/olsrd2 -l /config/olsrd2/olsrd2.conf" | grep -v grep | awk '{print $2;}' | xargs kill 2>/dev/null
sleep 1
rm -f /var/lock/olsrd2
echo "Starting olsrd2..."
/config/olsrd2/olsrd2 -l /config/olsrd2/olsrd2.conf

echo "Retrieving IF and Link info..."
sleep 2
echo /nhdpinfo head if_addr | nc localhost 2009
echo /nhdpinfo if_addr | nc localhost 2009
echo ""
echo /nhdpinfo head link_addr | nc localhost 2009
echo /nhdpinfo link_addr | nc localhost 2009
echo ""
