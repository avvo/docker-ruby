FROM ruby:2.4-alpine
MAINTAINER Greg Orlov <greg@avvo.com>

RUN apk update \
  && apk upgrade \
  && apk add \
    build-base \
    ruby-bigdecimal \
    ruby-dev \
    ruby-io-console \
    ruby-json \
    tzdata \
  && update-ca-certificates \
  && rm -rf /var/cache/apk/* \
  && mkdir -p /srv \
  && bundle config build.nokogiri --use-system-libraries

CMD ["/usr/bin/ruby", "--version"]
