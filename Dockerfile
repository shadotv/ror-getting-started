# Pull default image for ruby 2.5
FROM ruby:2.5
# Set Fandom working dir
RUN mkdir /ror-getting-started
WORKDIR /ror-getting-started
# Copy package definition files
COPY ./Gemfile ./Gemfile.lock ./package.json /ror-getting-started/
# Install required packages
RUN curl -fsSL https://deb.nodesource.com/setup_14.x | bash - && \
    wget https://dl.yarnpkg.com/debian/pubkey.gpg && \
    cat pubkey.gpg | apt-key add - && \
    echo "deb http://apt.postgresql.org/pub/repos/apt `lsb_release -cs`-pgdg main" | tee /etc/apt/sources.list.d/pgdg.list && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 7FCC7D46ACCC4CF8 && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt update -qq && apt install -y build-essential nodejs postgresql-client-13 vim yarn && \
    gem install bundler && \
    bundle install && yarn install --check-files
# Copy all application files (except those listed in .dockerignore)
COPY . /ror-getting-started
# Expose port 3000 (rails) and 3035 (webpack)
EXPOSE 3000 3035
# Start rails server
CMD ["tail","-f","/dev/null"]