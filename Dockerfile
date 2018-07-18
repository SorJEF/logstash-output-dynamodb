# FROM jruby:1.7.27
FROM jruby:9

MAINTAINER Jason Pilz "jasonpilz@gmail.com"

ENV APP=/var/app \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US:en

RUN apt-get update \
    && rm -rf /var/lib/apt/lists/* \
    && wget -O /usr/local/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.2.0/dumb-init_1.2.0_amd64 \
    && chmod +x /usr/local/bin/dumb-init

COPY .env logstash-output-dynamodb.gemspec Gemfile* $APP/

WORKDIR $APP

RUN gem install dotenv \
    && dotenv bundle --jobs 20

ENTRYPOINT ["/usr/local/bin/dumb-init", "--", "bundle", "exec"]

CMD ["rspec"]
