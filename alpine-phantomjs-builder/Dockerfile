FROM alpine:3.5

ENV PHANTOMJS_VERSION 2.1.1
COPY *.patch /

#		libc-dev \

# This is a builder Dockerfile.  Condensing to a single RUN line is actually
# counter-productive.  Normal docker images need to be small, so condensing
# is desirable.  In this case we don't retain the image, and instead just
# consume the output of the image.  To that end, we speed builds up if we
# take advantage of Docker's layers.  This is a gigantic and slow build, so
# we need to throw in any time saving measures we can get.
RUN apk add --no-cache --virtual .build-deps \
		bison \
		flex \
		fontconfig-dev \
		freetype-dev \
		g++ \
		gcc \
                giflib-dev \
		git \
		gperf \
                icu-dev \
		libx11-dev \
		libxext-dev \
		linux-headers \
		make \
		openssl-dev \
		paxctl \
                pcre-dev \
		perl \
		python \
		ruby
RUN mkdir -p /usr/src
#WORKDIR /usr/src
RUN git clone --depth 1 -b $PHANTOMJS_VERSION git://github.com/ariya/phantomjs.git /usr/src/phantomjs
WORKDIR /usr/src/phantomjs
#RUN git checkout $PHANTOMJS_VERSION \
RUN git submodule init
RUN git submodule update
RUN for i in qtbase qtwebkit; do \
		cd /usr/src/phantomjs/src/qt/$i \
			&& patch -p1 -i /$i*.patch || break; \
		done
RUN patch -p1 -i /build.patch
RUN patch -p1 -i /build-deps.patch
RUN patch -p1 -i /build-nonstatic.patch

# build phantomjs
RUN python build.py --confirm --skip-qtwebkit --skip-qtbase
RUN paxctl -cm bin/phantomjs
RUN strip --strip-all bin/phantomjs
RUN install -m755 bin/phantomjs /usr/bin/phantomjs
RUN runDeps="$( \
		scanelf --needed --nobanner /usr/bin/phantomjs \
			| awk '{ gsub(/,/, "\nso:", $2); print "so:" $2 }' \
			| sort -u \
			| xargs -r apk info --installed \
			| sort -u \
	)" \
	&& apk add --virtual .phantomjs-rundeps $runDeps
RUN apk del .build-deps
RUN rm -r /*.patch /usr/src

RUN apk add patchelf --update-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted

# package binary build
#RUN cd /root
WORKDIR /root
RUN mkdir -p phantomjs/lib
RUN cp /usr/bin/phantomjs phantomjs/
WORKDIR /root/phantomjs
RUN for lib in `ldd phantomjs \
      | awk '{if(substr($3,0,1)=="/") print $1,$3}' \
      | cut -d' ' -f2`; do \
        cp $lib lib/`basename $lib`; \
      done
RUN patchelf --set-rpath '$ORIGIN/lib' phantomjs
WORKDIR /root
RUN tar cvf phantomjs.tar phantomjs
RUN bzip2 -9 phantomjs.tar
WORKDIR /
