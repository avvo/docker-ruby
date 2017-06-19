FROM avvo/alpine:3.5
RUN apk update \
	&& apk add ruby=2.3.3-r0 \
	&& gem install --no-document bundler \
	&& mkdir /srv
RUN rm -f /var/cache/apk/*
VOLUME ["/srv"]

CMD ["/usr/bin/ruby", "--version"]
