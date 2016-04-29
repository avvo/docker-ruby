FROM alpine
MAINTAINER Jeff Ching <jching@avvo.com>

RUN apk update && \
    apk upgrade && \
    apk add zlib-dev libxml2-dev libxslt-dev tzdata build-base linux-headers openssl-dev && \
    apk add ruby ruby-dev ruby-io-console ruby-json && \
    rm -rf /var/cache/apk/* && \
    mkdir /srv && \
  	gem install --no-document bundler && \
    bundle config build.nokogiri --use-system-libraries

VOLUME ["/srv"]

CMD ["/usr/bin/ruby", "--version"]
