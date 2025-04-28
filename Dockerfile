FROM ruby:3.2-slim

WORKDIR /app

# Install dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    && rm -rf /var/lib/apt/lists/*

# Copy Gemfile first (for better caching)
COPY Gemfile* /app/

# If Gemfile.lock doesn't exist, create one
RUN if [ ! -f Gemfile.lock ]; then touch Gemfile.lock; fi

# Install gems
RUN bundle install

# Copy the application
COPY . /app/

EXPOSE 4000

# Watch for changes and serve
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]