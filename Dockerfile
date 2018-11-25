FROM ruby:2.5
RUN apt-get update -yqq
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs 
COPY api_authentication /usr/src/app
COPY . /usr/src/app/
COPY Gemfile /usr/src/app
COPY Gemfile.lock /usr/src/app
WORKDIR /usr/src/app
RUN bundle install
CMD ["rails", "s", "-b", "0.0.0.0"]
EXPOSE 3000


# Set an environment variable where the Rails app is installed to inside of Docker image
