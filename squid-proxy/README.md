## Description

`squid-proxy` could be used to build an HTTP proxy quickly.

## Environment

Environment|Default vaule
:--|:--
SQUID_PROXY_USERNAME|admin
SQUID_PROXY_PASSWORD|admin

## Example

```bash
docker run -d \
    --name squid-proxy
    -p 3128:3128 \
    -e SQUID_PROXY_PASSWORD=mypassword \
    major1201/squid-proxy
```
