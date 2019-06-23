ARG FRP_VER=0.25.1
ARG PLATFORM="linux_amd64"

FROM alpine:3.9

ENV FRP_TOKEN ""

ADD https://github.com/fatedier/frp/releases/download/v${FRP_VER}/frp_${FRP_VER}_${PLATFORM}.tar.gz /usr/local/

COPY frps.ini /etc/frps.ini
COPY entrypoint.sh /entrypoint.sh

RUN tar zxf /usr/local/frp_${FRP_VER}_${PLATFORM}.tar.gz -C /usr/local/ \
    && mv /usr/local/frp_${FRP_VER}_${PLATFORM} /usr/local/frp \
    && rm -f /usr/local/frp_${FRP_VER}_${PLATFORM}.tar.gz \
    && chmod +x /entrypoint.sh

EXPOSE 7000

ENTRYPOINT ["/entrypoint.sh"]
