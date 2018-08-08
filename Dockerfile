# FROM ubuntu:18.04
FROM ruby:2.5.1
MAINTAINER Lucas Sartori <faltou.criatividade0@gmail.com>

ENV RUBY_DEFAULT_VERSION=2.5.1
ENV TZ=America/Sao_Paulo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && apt-get -y upgrade
RUN apt-get install build-essential -y
RUN apt-get install curl -y

# Install RVM
# RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
# RUN \curl -sSL https://get.rvm.io | bash -s stable
# RUN source ~/.rvm/scripts/rvm

# # Install Ruby
# RUN rvm install $RUBY_DEFAULT_VERSION
# RUN rvm use $RUBY_DEFAULT_VERSION
# RUN rvm use $RUBY_DEFAULT_VERSION --default

# GEM
RUN echo "gem: --no-document" > ~/.gemrc
RUN gem install bundler

# Install Rails
RUN gem install rails

# Custom Bash
RUN export PS1='\u ${debian_chroot:+($debian_chroot)}\[\e[0;33m\]\A\[\e[m\] :\w \[\e[0;33m\]`~/.rvm/bin/rvm-prompt i v g` `git branch 2> /dev/null | grep -e ^* | sed -E s/^\\\\\*\ \(.+\)$/\(\\\\\1\)\ /`\n\[\033[37m\]$\[\033[00m\] '

RUN mkdir /var/www

# Expose ports.
EXPOSE 80
EXPOSE 3000
EXPOSE 3306

CMD /bin/bash