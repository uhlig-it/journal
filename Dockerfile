FROM ruby:alpine

RUN apk add --no-cache                         \
      build-base                               \
      postgresql-dev                           \
  && rm -rf /var/cache/apk/*                   \
  && rm -rf /usr/local/lib/ruby/gems/*/cache/* \
  && rm -rf ~/.gem

RUN mkdir /app
ADD . /app
WORKDIR /app

RUN bundle config set --local without 'development test'
RUN bundle install --jobs 4

CMD bundle exec ruby app.rb -o 0.0.0.0
