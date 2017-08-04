FROM avvo/ubuntu:14.04
MAINTAINER Avvo Infrastructure Team <infrastructure@avvo.com>

# There are a few different tars of phantomjs floating around in various
# URLs on github and other places.  Their archives are packaged in different
# ways though and might not extract files with the same names.

# Use wget to pull down files instead of trying to be clever and use
# a URL in an ADD statement.  The benefit is that wget adds tuneable
# retry options that we can leverage for more reliable builds.

ENV PHANTOMJS_VERSION 2.1.1
ENV PHANTOMJS_ARCH linux-x86_64
ENV RUBY_VERSION 2.3
ENV NOKOGIRI_VERSION 1.6.7.2

RUN BUILD_DEPS=" \
      build-essential \
      libxml2-dev \
      libxslt1-dev \
      zlib1g-dev \
      software-properties-common \
      " && \
    echo "Installing dependencies" && \
      apt-get update && \
      apt-get -y install \
        libxml2 \
        libxslt1.1 \
        wget \
        bash \
        fontconfig \
        $BUILD_DEPS \
        && \
    echo "Installing phantomjs ${PHANTOMJS_VERSION}" && \
      wget \
        --retry-connrefused \
        --no-verbose \
        -t 30 \
        --waitretry=10 \
        -O /tmp/phantomjs.tar.bz2 \
        "https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-${PHANTOMJS_VERSION}-${PHANTOMJS_ARCH}.tar.bz2" \
        && \
      tar -C /tmp -xvjf /tmp/phantomjs.tar.bz2 && \
      cp /tmp/phantomjs-*/bin/phantomjs /usr/local/bin/phantomjs && \
      chmod a+rx /usr/local/bin/phantomjs && \
      rm -rf \
        /tmp/phantomjs.tar.bz2 \
        /tmp/phantomjs-* \
        && \
      ls -al /usr/local/bin/phantomjs && \
      echo "Phantomjs `/usr/local/bin/phantomjs -v` installed." && \
    echo "Installing ruby${RUBY_VERSION}" && \
      add-apt-repository -y ppa:brightbox/ruby-ng && \
      apt-get update && \
      apt-get -y install \
        ruby2.3 \
        ruby2.3-dev \
        ruby-switch \
        && \
      ruby-switch --set ruby2.3 && \
    echo "Installing gems" && \
      gem install --no-document mini_racer && \
      gem install --no-document nokogiri -v "$NOKOGIRI_VERSION" -- --use-system-libraries=true --with-xml2-include=/usr/include/libxml2 && \
    echo "Cleaning up" && \
      apt-get remove -y \
        $BUILD_DEPS \
        && \
      apt-get autoremove -y && \
      rm -rf /var/lib/apt/lists/* && \
    echo "Installation complete"

CMD ["/usr/bin/ruby", "--version"]

# Adding the Dockerfile to the image is often helpful for deriving from
# the image, recovering from failures, or rebuilding the image without
# source.  Also not very costly to include.  Leaving it for last is best
# so everything doesn't get rebuilt on every Dockerfile change.
ADD Dockerfile /
