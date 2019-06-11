## Description

`rpmbuild` could be used to build RPM without messing up your environment

## Environment

None.

## Example

```bash
# for el6, please use major1201/rpmbuild:6
docker run --rm \
    -v "$PWD/SOURCES":/root/rpmbuild/SOURCES:ro \
    -v "$PWD/SPECS":/root/rpmbuild/SPECS:ro \
    -v "$PWD/RPMS":/root/rpmbuild/RPMS \
    major1201/rpmbuild:7 \
    SPECS/nginx7.spec
```
