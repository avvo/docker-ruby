FROM avvo/alpine:3.5
MAINTAINER Avvo Infrastructure <infrastructure@avvo.com>

RUN apk update && \
    apk upgrade && \
    apk add \
      build-base \
      ca-certificates \
      libxml2-dev \
      libxslt-dev \
      linux-headers \
      openssl-dev \
      'ruby=2.3.3-r0' \
      ruby-bigdecimal \
      ruby-dev \
      ruby-io-console \
      ruby-irb \
      ruby-json \
      ruby-libs \
      ruby-minitest \
      ruby-rake \
      ruby-rdoc \
      tzdata \
      zlib-dev && \
    rm -rf /var/cache/apk/* && \
    update-ca-certificates && \
    mkdir -p /srv && \
    gem install --no-document bundler -v 1.15.1 && \
    bundle config build.nokogiri --use-system-libraries

CMD ["/usr/bin/ruby", "--version"]
