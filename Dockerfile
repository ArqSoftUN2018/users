# configuration of self nginx
FROM juligarji/users-nginx
FROM ruby:2.5.0
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs 
# Set an environment variable where the Rails app is installed to inside of Docker image
ENV RAILS_ROOT /var/www/users
RUN mkdir -p $RAILS_ROOT 
# Set working directory
WORKDIR $RAILS_ROOT
# Setting env up
ENV RAILS_ENV='production'
ENV RACK_ENV='production' 
# Adding gems
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
COPY api_authentication /var/www/users/
#RUN gem install i18n -v 1.1.1
#RUN gem install nokogiri -v 1.8.5
#RUN gem install mail -v 2.7.1
#RUN gem install jwt -v 2.1.0
#RUN gem install delayed_job_active_record
#RUN gem install puma 
RUN bundle install --jobs 20 --retry 20 --without development test 
# Adding project files
COPY . .
#RUN bundle exec rake assets:precompile
EXPOSE 3000
CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]