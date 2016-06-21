FROM alpine
RUN apk update && \
    apk add ruby && \
    gem install --no-document bundler -v 1.12.5 && \
    mkdir -p /srv
RUN rm -f /var/cache/apk/*

CMD ["/usr/bin/ruby", "--version"]
