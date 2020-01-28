FROM alpine:3.11.3 as builder

WORKDIR /opt/opentracker

RUN set -x \
    && apk add git cvs gcc make libc-dev zlib-dev \
    && cvs -d :pserver:cvs@cvs.fefe.de:/cvs -z9 co libowfat \
    && cd libowfat \
    && make \
    && cd .. \
    && git clone git://erdgeist.org/opentracker \
    && cd opentracker \
    && make

FROM alpine:3.11.3

RUN mkdir /etc/opentracker

COPY --from=builder /opt/opentracker/opentracker/opentracker /opt/opentracker/opentracker/opentracker.debug /usr/bin/
COPY --from=builder /opt/opentracker/opentracker/opentracker.conf.sample /etc/opentracker/opentracker.conf

VOLUME [ "/etc/opentracker" ]
EXPOSE 6969 6969/udp

CMD [ "/usr/bin/opentracker", "-f", "/etc/opentracker/opentracker.conf" ]
