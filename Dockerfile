FROM ruby:2.4.0

RUN curl -sL https://deb.nodesource.com/setup_7.x | bash -
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs apt-transport-https
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -qq && apt-get install -y yarn

RUN mkdir /TEE
WORKDIR /TEE

COPY Gemfile /TEE/Gemfile
COPY Gemfile.lock /TEE/Gemfile.lock
COPY yarn.lock /TEE/yarn.lock
COPY client/yarn.lock /TEE/client/yarn.lock
RUN bundle install -j4

COPY . /TEE
RUN yarn
RUN cd client && yarn && cd ..

RUN rm /TEE/config/database.yml
COPY config/database.docker.yml /TEE/config/database.yml

RUN bundle exec rake assets:precompile
RUN mkdir -p tmp/
