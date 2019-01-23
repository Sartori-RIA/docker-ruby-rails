# FROM ubuntu:18.04
FROM ruby:2.5
MAINTAINER Lucas Sartori <faltou.criatividade0@gmail.com>

ENV TZ=America/Sao_Paulo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && apt-get -y upgrade
RUN apt-get install sudo nano
RUN apt-get install build-essential -y
RUN apt-get install curl -y
RUN apt-get install yarn -y

# NODE & NPM
RUN curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
RUN /setup_10.x | sudo -E bash -

# GEM
RUN echo "gem: --no-document" > ~/.gemrc
RUN gem install bundler

# Install Rails
RUN gem install rails

RUN mkdir /var/www

# Expose ports.
EXPOSE 80
EXPOSE 3000
EXPOSE 3306

CMD /bin/bash