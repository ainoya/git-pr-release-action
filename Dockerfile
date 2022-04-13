FROM ruby:3.0.0-slim-buster

RUN apt-get update && apt-get install -y \ 
  git tzdata \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* \
  && gem install --no-document git-pr-release

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
