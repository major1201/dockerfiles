FROM alpine:3.9

ARG KUBECTL_VERSION=1.15.1
ARG HELM_VERSION=2.14.2
ARG KUBECTX_VERSION=0.6.3
ARG STERN_VERSION=1.11.0

RUN apk add --no-cache -t build curl \
    && cd /tmp \
    # kubectl
    && curl -L -o /usr/bin/kubectl https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl \
    # helm
    && curl -L -O https://get.helm.sh/helm-v${HELM_VERSION}-linux-amd64.tar.gz \
    && tar zxf helm-v${HELM_VERSION}-linux-amd64.tar.gz \
    && mv linux-amd64/helm /usr/bin/helm \
    # kubectx
    && curl -L -o kubectx-v${KUBECTX_VERSION}.tar.gz https://github.com/ahmetb/kubectx/archive/v${KUBECTX_VERSION}.tar.gz \
    && tar zxf kubectx-v${KUBECTX_VERSION}.tar.gz \
    && cd kubectx* && mv kubectx /usr/bin/kubectx && mv kubens /usr/bin/kubens \
    && mv completion /opt/kubectx_completion \
    # stern
    && curl -L -o /usr/bin/stern https://github.com/wercker/stern/releases/download/${STERN_VERSION}/stern_linux_amd64 \
    && chmod +x /usr/bin/kubectl /usr/bin/stern \
    # finalize
    && rm -rf /tmp/* && apk del build \
    && mkdir -p /root/.kube /root/.helm

VOLUME [ "/root/.kube", "/root/.helm" ]

COPY completion.sh /usr/bin/completion

RUN chmod +x /usr/bin/completion
