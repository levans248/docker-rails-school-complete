# references the ruby image that we want to use, ruby version 2.3.1
FROM ruby:2.3.1
# build essential is required to compile debian package and libpq-dev is for postgres
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev
# set environmental variable
ENV RAILS_ROOT /rails_app
# create tmp/pids directory in rails app root folder
RUN mkdir -p $RAILS_ROOT/tmp/pids
# set working directory to rails root
WORKDIR $RAILS_ROOT
# copy gemfile over
COPY Gemfile Gemfile
# copy gemfile.lock
COPY Gemfile.lock Gemfile.lock
# install bundler gem
RUN gem install bundler
# run bundle install
RUN bundle install
# copy rails app over
COPY . .
