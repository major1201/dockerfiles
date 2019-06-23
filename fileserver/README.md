## Description

`fileserver` could be used to build run a file server.

## Example

```bash
docker run -d \
    --name fileserver
    -p 8080:80 \
    -v sharedir:/var/www/html \
    major1201/fileserver
```
