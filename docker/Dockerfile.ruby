FROM ruby:2.7.4

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
  && apt-get update -qq \
  && apt-get install -y \
  --no-install-recommends \
  build-essential \
  apt-utils libpq-dev \
  nodejs yarn

WORKDIR /app

CMD ["/app/docker-entry-point-ruby.sh"]
