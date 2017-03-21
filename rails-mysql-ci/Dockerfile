FROM avvo/ruby-rails-mysql
MAINTAINER Avvo Infrastructure Team <infrastructure@avvo.com>

RUN apk update && \
  apk add --no-cache aspell-dev libffi-dev git openssh-client ruby-irb mysql-client curl tar gzip hunspell hunspell-dev mariadb-dev nodejs && \
  gem install --no-ri --no-rdoc bundler && \
  cp /usr/share/zoneinfo/America/Los_Angeles /etc/localtime && \
  echo "America/Los_Angeles" > /etc/timezone

RUN apk add --no-cache autoconf gcc g++ libtool make ruby-rdoc imagemagick imagemagick-dev &&\
    convert -version

RUN apk add --no-cache fontconfig && \
  mkdir -p /usr/share && \
  cd /usr/share \
  && curl -L https://github.com/Overbryd/docker-phantomjs-alpine/releases/download/2.11/phantomjs-alpine-x86_64.tar.bz2 | tar xj \
  && ln -s /usr/share/phantomjs/phantomjs /usr/bin/phantomjs \
  && phantomjs --version

CMD ["/usr/bin/ruby", "--version"]
