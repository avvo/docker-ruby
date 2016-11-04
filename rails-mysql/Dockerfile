FROM alpine
MAINTAINER Jeff Ching <jching@avvo.com>

RUN apk update && \
    apk upgrade && \
    apk add zlib-dev libxml2-dev libxslt-dev tzdata build-base linux-headers openssl-dev ca-certificates && \
    apk add ruby ruby-irb ruby-dev ruby-io-console ruby-json ruby-bigdecimal && \
    update-ca-certificates && \
    rm -rf /var/cache/apk/* && \
    mkdir -p /srv && \
    gem install --no-document bundler -v 1.12.5  && \
    bundle config build.nokogiri --use-system-libraries

RUN apk update && \
    apk upgrade && \
    apk add mysql-dev && \
    rm -rf /var/cache/apk/*

CMD ["/usr/bin/ruby", "--version"]
