FROM centos:7

LABEL name="openssh:centos-7" \
    description="Centos 7 based openssh server"

RUN yum install -y openssh-server \
    && /usr/bin/ssh-keygen -A \
    && sed -i -e '/PermitRootLogin/c\PermitRootLogin yes' -e '/UseDNS/c\UseDNS no' /etc/ssh/sshd_config \
    && echo 'root:111' | chpasswd

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
