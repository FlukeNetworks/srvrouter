#!/usr/bin/env bash
while [ true ]; do
	cp /etc/haproxy/haproxy.cfg /etc/haproxy/haproxy.cfg.old
	srvrouter --service $SRVROUTER_SERVICE_NAME --name $SRVROUTER_DNS_NAME -o /etc/haproxy/haproxy.cfg
	changed=$(diff /etc/haproxy/haproxy.cfg /etc/haproxy/haproxy.cfg.old)
	if [ ! -z "$changed" ]; then
		supervisorctl restart haproxy
	fi
	sleep 5
done
