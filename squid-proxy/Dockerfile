FROM alpine:3.9

ENV SQUID_PROXY_USERNAME admin
ENV SQUID_PROXY_PASSWORD admin

COPY squid.conf /etc/squid/squid.conf
COPY start.sh /start.sh

RUN apk add --upgrade --no-cache squid apache2-utils \
    && chmod +x /start.sh

EXPOSE 3128

CMD ["/start.sh"]
