FROM alpine:3.5
MAINTAINER Infrastructure <infrastructure@avvo.com>

RUN apk update && \
    apk upgrade && \
    apk add zlib-dev libxml2-dev libxslt-dev tzdata build-base linux-headers openssl-dev ca-certificates && \
    apk add ruby=2.3.3-r0 ruby-dev=2.3.3-r0 ruby-io-console=2.3.3-r0 ruby-json=2.3.3-r0 ruby-bigdecimal=2.3.3-r0 && \
    update-ca-certificates && \
    rm -rf /var/cache/apk/* && \
    mkdir -p /srv && \
    gem install --no-document bundler -v 1.12.5 && \
    bundle config build.nokogiri --use-system-libraries

CMD ["/usr/bin/ruby", "--version"]
