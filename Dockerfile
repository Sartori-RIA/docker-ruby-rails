FROM ruby:2.5
RUN rm /bin/sh && ln -s /bin/bash /bin/sh
MAINTAINER Lucas Sartori <faltou.criatividade0@gmail.com>

ENV TZ=America/Sao_Paulo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && apt-get -y upgrade
RUN apt-get install sudo ca-certificates apt-utils gnupg2 nano build-essential curl yarn -y

# NVM

ENV NVM_DIR /usr/local/nvm
ENV NODE_VERSION 11.14.0
RUN mkdir $NVM_DIR
RUN curl --silent -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash
RUN source $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default
ENV NODE_PATH $NVM_DIR/versions/node/v$NODE_VERSION/lib/node_modules
ENV PATH      $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH

# GEM
RUN echo "gem: --no-document" > ~/.gemrc
RUN gem install bundler

# RAILS
RUN gem install rails

# TYPESCRIPT
RUN npm i -g typescript

# SASS
RUN gem install sass

RUN mkdir /var/www

# Expose ports.
EXPOSE 80
EXPOSE 3000
EXPOSE 3306
EXPOSE 4200

CMD /bin/bash