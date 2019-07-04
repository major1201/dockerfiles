## Environment

Environment|Default vaule
:--|:--
FRP_TOKEN|

## Example

```bash
docker run -d \
    --name frps \
    -p 7000:7000 \
    -p 6001-6010:6001-6010 \
    -e FRP_TOKEN=password \
    major1201/frps
```

Port `6001-6010` is reserved for proxy ports
