FROM ruby:2.4.1-slim
LABEL maintainer "Hector Salazar <hslzr.com>"

RUN apt-get update -qq && apt-get -qq install -y --no-install-recommends \
    build-essential libpq-dev

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY Gemfile .
COPY Gemfile.lock .
RUN bundle install -j20 --quiet

EXPOSE 4567

CMD ["bundle", "exec", "shotgun", "config.ru", "--server=thin", "--port=4567", "--host=0.0.0.0"]
