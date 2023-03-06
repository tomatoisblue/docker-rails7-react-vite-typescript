FROM ruby:3.1

# Update package list
RUN apt update -qq &&\
    apt install -qq -y vim &&\
    curl -sL https://deb.nodesource.com/setup_16.x | bash - &&\
    apt install -qq -y nodejs &&\
    npm install -g yarn

# Copy Gemfile, Gemfile.lock
WORKDIR /src
COPY Gemfile Gemfile.lock /src/

# Run bundle install
RUN bundle install

# EXPOSE port 3000 for puma server
EXPOSE 3000
