FROM debian:stretch

COPY sources.list /etc/apt/sources.list
RUN apt-get update\
    && apt-get install -y apt-transport-https\
    && sed -i s/http/https/g /etc/apt/sources.list\
    && apt-get update\
    && apt-get install -y vim curl wget xz-utils zsh git sshpass lrzsz fping tmux openssh-server\
    && sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"\
    && mv /root/.zshrc /root/.zshrc.bak\
    && /usr/bin/ssh-keygen -A\
    && mkdir -p /run/sshd\
    && sed -i '/PermitRootLogin/c\PermitRootLogin yes' /etc/ssh/sshd_config \
    && echo 'root:111' | chpasswd\
    && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

COPY pip.conf /root/.pip/pip.conf
COPY .gitconfig /root/.gitconfig
COPY .zshrc /root/.zshrc
COPY .vimrc /root/.vimrc

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
