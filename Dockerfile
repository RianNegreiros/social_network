FROM ruby:3.1.1

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs npm

RUN npm install --global yarn

RUN mkdir /app
WORKDIR /app
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install
COPY package.json /app/package.json
COPY yarn.lock /app/yarn.lock
RUN yarn install --check-files
COPY . /app
EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]