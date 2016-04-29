FROM alpine
RUN apk update \
	&& apk add ruby \
	&& gem install --no-document bundler \
	&& mkdir /srv
RUN rm -f /var/cache/apk/*

CMD ["/usr/bin/ruby", "--version"]
