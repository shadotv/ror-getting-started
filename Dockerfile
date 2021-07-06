# Pull default image for ruby 2.5
FROM ruby:2.5
# Set Fandom working dir
RUN mkdir /ror-getting-started
WORKDIR /ror-getting-started
# Copy package definition files
COPY ./Gemfile ./Gemfile.lock ./package.json /ror-getting-started/
# Install required packages
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt update -qq && apt install -y build-essential nodejs postgresql-client vim yarn && \
    gem install foreman bundler && \
    bundle install && yarn install --check-files
# Copy all application files (except those listed in .dockerignore)
COPY . /ror-getting-started
# Expose port 3000 (rails) and 3035 (webpack)
EXPOSE 3000 3035
# Start rails server
CMD ["foreman","start"]