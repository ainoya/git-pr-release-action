FROM ruby:2.7.3-alpine3.13

LABEL "com.github.actions.name"="git-pr-release"
LABEL "com.github.actions.description"="Run git-pr-release"
LABEL "com.github.actions.icon"="check-square"
LABEL "com.github.actions.color"="green"

LABEL "repository"="https://github.com/bakunyo/git-pr-release-action"
LABEL "maintainer"="bakunyo <izuta.hiroyuki@gmail.com>"

RUN apk --update --no-cache add git tzdata && \
    cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && \
    rm -rf /var/cache/apk/*
ADD Gemfile .
ADD Gemfile.lock .
RUN bundle install

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
