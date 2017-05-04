FROM ruby:2.4.0

RUN curl -sL https://deb.nodesource.com/setup_7.x | bash - && apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs apt-transport-https && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && apt-get update -qq && apt-get install -y yarn && apt-get clean

RUN mkdir /TEE
WORKDIR /TEE

COPY Gemfile /TEE
COPY Gemfile.lock /TEE
COPY yarn.lock /TEE
COPY client/yarn.lock /TEE/client/yarn.lock

RUN bundle install -j4

COPY . /TEE
RUN yarn
RUN cd client && yarn && cd ..

RUN bundle exec rake assets:precompile
RUN mkdir -p /TEE/tmp/sockets && mkdir -p /TEE/tmp/pids

EXPOSE 3000
CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
