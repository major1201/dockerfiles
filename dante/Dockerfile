FROM alpine:3.9

COPY entrypoint.sh /entrypoint.sh
COPY sockd.conf /etc/sockd/sockd.conf

ENV DANTE_USERNAME="" DANTE_PASSWORD=""

RUN set -x \
    && chmod +x /entrypoint.sh \
    && apk add --no-cache linux-pam \
    && apk add --no-cache -t .build-deps build-base curl linux-pam-dev \
    && cd /tmp && curl -L https://www.inet.no/dante/files/dante-1.4.2.tar.gz | tar xz \
    && cd dante-* \
    && ac_cv_func_sched_setscheduler=no ./configure \
    && make install \
    && cd / \
    # Add an unprivileged user.
    && adduser -S -D -u 8062 -H sockd \
    # clean up
    && rm -rf /tmp/* \
    && apk del --purge .build-deps

EXPOSE 1080
VOLUME [ "/etc/sockd" ]
ENTRYPOINT ["/entrypoint.sh"]
