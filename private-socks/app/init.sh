#!/bin/sh
while true;
do
	ps a | grep -q tun0 && break
	sleep 1s
done

killall -9 sockd 2>/dev/null || true

#for ip in ${DNS};
#do
#	echo "  forward-addr: $ip" >> /etc/unbound/unbound.conf
#done
#echo "    forward-ssl-upstream: yes" >> /etc/unbound/unbound.conf

echo nameserver $(dig +short unbound) > /etc/resolv.conf

sockd -N 2 -D
