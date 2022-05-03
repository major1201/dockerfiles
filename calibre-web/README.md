## Description

`calibre-web` extends <https://github.com/linuxserver/docker-calibre-web/> and added init packages to the image

## Example

```bash
docker run -d \
  --name=calibre-web \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Europe/London \
  -p 8083:8083 \
  -v /root/config:/config \
  -v /root/library:/books \
  major1201/calibre-web:0.6.18
```

## Build command example

```bash
docker build --build-arg=REGION=cn --tag major1201/calibre-web:0.6.18 .
```
