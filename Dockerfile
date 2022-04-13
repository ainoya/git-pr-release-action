FROM ruby:3.0.0-slim-buster

RUN apk --update --no-cache upgrade && \
    apk --no-cache add git tzdata && \
    gem install --no-document git-pr-release

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
