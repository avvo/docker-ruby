FROM avvo/alpine:3.5
RUN apk update && \
    apk add ruby=2.3.3-r0 ruby-dev=2.3.3-r0 ruby-io-console=2.3.3-r0 ruby-json=2.3.3-r0 ruby-bigdecimal=2.3.3-r0 ca-certificates && \
    gem install --no-document bundler -v 1.12.5 && \
    mkdir -p /srv
RUN rm -f /var/cache/apk/*

CMD ["/usr/bin/ruby", "--version"]
