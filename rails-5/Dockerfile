FROM avvo/alpine:latest
MAINTAINER Avvo Infrastructure <infrastructure@avvo.com>

RUN apk update && \
    apk upgrade && \
    apk add \
      build-base \
      ca-certificates \
      libressl-dev \
      libxml2-dev \
      libxslt-dev \
      linux-headers \
      ruby \
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
      zlib-dev
RUN rm -rf /var/cache/apk/* && \
    update-ca-certificates && \
    mkdir -p /srv && \
    gem install --no-document bundler && \
    bundle config build.nokogiri --use-system-libraries

CMD ["/usr/bin/ruby", "--version"]
