# Sample Docker file
# 
# To create your image execute: 
#                    docker build . -t sample-rails
# To run the image execute: 
#                    docker run -p 3000:3000 sample-rails
#           and the visit http://localhost:3000 in your browser
# To run unit tests execute:
#                    docker run sample-rails bundle exec rspec spec/

FROM ruby:2.0.0


RUN apt-get update && apt-get install -y nodejs --no-install-recommends  \
    && apt-get install -y mysql-client postgresql-client sqlite3 --no-install-recommends && rm -rf /var/lib/apt/lists/* \
# throw errors if Gemfile has been modified since Gemfile.lock
   && bundle config --global frozen 1 \
   && mkdir -p /usr/src/app


WORKDIR /usr/src/app

COPY Gemfile /usr/src/app/
COPY Gemfile.lock /usr/src/app/
COPY config/database.yml.example config/database.yml
RUN bundle install
COPY . /usr/src/app
RUN bin/rake db:migrate RAILS_ENV=development

EXPOSE 3000
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
