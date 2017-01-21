FROM ruby:2.3-alpine
MAINTAINER Greg Orlov <greg@avvo.com>

RUN apk update \
  && apk upgrade \
  && apk add \
    build-base \
    ca-certificates
    libxml2-dev \
    libxslt-dev \
    linux-headers \
    openssl-dev \
    ruby-bigdecimal \
    ruby-dev \
    ruby-io-console \
    ruby-json \
    tzdata \
    zlib-dev \
  && update-ca-certificates \
  && rm -rf /var/cache/apk/* \
  && mkdir -p /srv \
  && gem install --no-document bundler -v 1.12.5 \
  && bundle config build.nokogiri --use-system-libraries

CMD ["/usr/bin/ruby", "--version"]
