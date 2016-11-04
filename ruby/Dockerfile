FROM alpine
RUN apk update && \
    apk add ruby ruby-irb ruby-dev ruby-io-console ruby-json ruby-bigdecimal ca-certificates && \
    gem install --no-document bundler -v 1.12.5 && \
    mkdir -p /srv
RUN rm -f /var/cache/apk/*

CMD ["/usr/bin/ruby", "--version"]
