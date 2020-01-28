## Description

`opentracker` is a open and free bittorrent tracker project.

## Example

```bash
docker run -d \
    --name opentracker \
    -p 6969:6969 \
    -p 6969:6969/udp \
    major1201/opentracker
```
