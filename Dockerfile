FROM ruby:2.7-slim

RUN apt-get -y update && \
  apt-get install -y curl gnupg
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
  apt-get -y update && \
  apt-get install -y build-essential libpq-dev libcurl4 nodejs yarn && \
  useradd -mU -d /app app
USER app
WORKDIR /app

COPY --chown=app:app Gemfile* ./
RUN bundle config --local deployment 'true' && \
  bundle config --local without 'development test' && \
  bundle install

ARG NODE_ENV=production

COPY package.json yarn.lock ./
RUN yarn install --frozen-lockfile

ARG RAILS_ENV=production

COPY --chown=app:app . .
RUN SECRET_KEY_BASE=$(printf %128s | tr ' ' '0') bundle exec rails assets:precompile

ENTRYPOINT ["bundle", "exec"]
CMD ["rails", "server"]
