FROM avvo/alpine:3.5
MAINTAINER Greg Orlov <greg@avvo.com>

RUN apk update && \
    apk upgrade && \
    apk add \
      'ruby<2.4' \
      ruby-dev \
      ruby-libs \
      ruby-minitest \
      ruby-rdoc \
      ruby-bigdecimal \
      ruby-io-console \
      ruby-json \
      ruby-irb \
      ruby-rake && \
    apk add zlib-dev \
      libxml2-dev \
      libxslt-dev \
      tzdata \
      build-base \
      linux-headers \
      openssl-dev \
      ca-certificates && \
    rm -rf /var/cache/apk/* && \
    update-ca-certificates && \
    mkdir -p /srv && \
    gem install --no-document bundler -v 1.15.1 && \
    bundle config build.nokogiri --use-system-libraries

CMD ["/usr/bin/ruby", "--version"]
