FROM avvo/ubuntu:14.04
MAINTAINER Avvo Infrastructure Team <infrastructure@avvo.com>

# Use wget to pull down files instead of trying to be clever and use
# a URL in an ADD statement.  The benefit is that wget adds tuneable
# retry options that we can leverage for more reliable builds.

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
