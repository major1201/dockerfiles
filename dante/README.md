## Description

`dante` could be used to build an SOCKS5 proxy quickly.

## Environment

Environment|Default vaule
:--|:--
DANTE_USERNAME|*empty*
DANTE_PASSWORD|*empty*

## Example

```bash
docker run -d \
    --name dante \
    -p 1080:1080 \
    -e DANTE_USERNAME=admin \
    -e DANTE_PASSWORD=admin \
    major1201/dante
```
