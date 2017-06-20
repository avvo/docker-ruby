FROM avvo/alpine:3.5
MAINTAINER Brandon Sislow <bsislow@avvo.com>

RUN apk update && \
    apk upgrade && \
    apk add \
      build-base \
      ca-certificates \
      libxml2-dev \
      libxslt-dev \
      libffi-dev \
      linux-headers \
      libressl-dev \
      'ruby<2.4' \
      ruby-bigdecimal \
      ruby-dev \
      ruby-io-console \
      ruby-irb \
      ruby-json \
      ruby-libs \
      ruby-minitest \
      ruby-rake \
      ruby-rdoc \
      mariadb-dev \
      tzdata \
      zlib-dev && \
    rm -rf /var/cache/apk/* && \
    update-ca-certificates && \
    mkdir -p /srv && \
    gem install --no-document bundler -v 1.15.1 && \
    bundle config build.nokogiri --use-system-libraries

CMD ["/usr/bin/ruby", "--version"]
