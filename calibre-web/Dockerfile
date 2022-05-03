ARG VERSION=0.6.18
FROM linuxserver/calibre-web:${VERSION}

ARG REGION

ADD ./assets /build/
RUN ls /etc/cont-init.d/ && /build/build.sh
