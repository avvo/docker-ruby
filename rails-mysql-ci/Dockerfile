FROM avvo/ruby-rails-mysql
MAINTAINER Avvo Infrastructure Team <infrastructure@avvo.com>

RUN apk update && \
  apk add aspell-dev libffi-dev git openssh-client ruby-irb mysql-client curl tar gzip && \
  gem install --no-ri --no-rdoc bundler && \
  cp /usr/share/zoneinfo/America/Los_Angeles /etc/localtime && \
  echo "America/Los_Angeles" > /etc/timezone && \
  rm -rf /var/cache/apk/*

CMD ["/usr/bin/ruby", "--version"]
