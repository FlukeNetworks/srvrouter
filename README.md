# srvrouter

Generates `haproxy.cfg` files from DNS SRV records. Primarily useful for load balancing services discovered through DNS.

## Usage

The docker container can be run with a command similar to the one below
```
docker run -p 80:80 -e SRVROUTER_SERVICE_NAME=nginx -e SRVROUTER_DNS_NAME=_webapp._tcp.marathon.mesos -d srvrouter
```

The following environment variables are used to configure `srvrouter`

| Variable name | Value |
| ------------- | ----- |
| SRVROUTER_SERVICE_NAME | Internal service name used to render HAproxy backend names |
| SRVROUTER_DNS_NAME | Name of the DNS SRV record to look up |

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

