# add zh_CN.utf8
#
# VERSION 2

FROM       debian:7
MAINTAINER djluo <dj.luo@baoyugame.com>

ADD ./sources.list /etc/apt/

RUN export http_proxy="http://172.17.42.1:8080/" \
    && export DEBIAN_FRONTEND=noninteractive     \
    && apt-get update \
    && apt-get install -y locales procps telnet curl cron \
    && localedef -c -i zh_CN -f UTF-8 zh_CN.UTF-8 \
    && localedef -c -i en_US -f UTF-8 en_US.UTF-8 \
    && export LANG="en_US.UTF-8"   \
    && export LC_ALL="en_US.UTF-8" \
    && apt-get clean \
    && unset http_proxy DEBIAN_FRONTEND \
    && rm -rf usr/share/locale \
    && rm -rf usr/share/man    \
    && rm -rf usr/share/doc    \
    && rm -rf usr/share/info   \
    && chmod -x /etc/cron.daily/* \
    && echo "alias grep='grep --color'" >  /etc/profile.d/alias.sh \
    && echo "alias l.='ls -d .*'"       >> /etc/profile.d/alias.sh \
    && echo "alias ll='ls -l'"          >> /etc/profile.d/alias.sh \
    && echo "alias ls='ls --color'"     >> /etc/profile.d/alias.sh \
    && echo "alias lt='ls -l --time-style=long-iso'" >> /etc/profile.d/alias.sh

ENV LANG   en_US.UTF-8
ENV LC_ALL en_US.UTF-8
