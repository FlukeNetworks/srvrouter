#!/usr/bin/env bash
while [ true ]; do
	cp /etc/haproxy/haproxy.cfg /etc/haproxy/haproxy.cfg.old
	srvrouter --service nginx --name _webapp._tcp.marathon.mesos -o /etc/haproxy/haproxy.cfg
	changed=$(diff /etc/haproxy/haproxy.cfg /etc/haproxy/haproxy.cfg.old)
	if [ ! -z "$changed" ]; then
		supervisorctl restart haproxy
	fi
done
