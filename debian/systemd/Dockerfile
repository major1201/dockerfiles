ARG TAG=buster
FROM debian:${TAG}

ARG REGION
ENV LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8 LC_CTYPE=en_US.UTF-8

ADD ./assets /build/
RUN /build/build.sh
VOLUME ["/sys/fs/cgroup", "/run", "/run/lock"]
CMD ["/lib/systemd/systemd"]
