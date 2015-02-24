FROM akiyama/ruby:latest
MAINTAINER Ryosuke Akiyama <ryosuke.akiyama@broadleaf.co.jp>

RUN gem install --no-ri --no-rdoc geminabox unicorn

WORKDIR /app
ADD ./config.ru /app/config.ru

RUN mkdir -p /app/data
VOLUME ["/app/data"]

EXPOSE 9292
CMD ["unicorn", "-p", "9292"]
