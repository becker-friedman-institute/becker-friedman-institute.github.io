FROM ruby:3.2-slim

WORKDIR /app

# Install dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    findutils \
    curl \
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

# Create an entrypoint script for debugging and serving
RUN echo '#!/bin/bash\n\
echo "Content of current directory:"\n\
ls -la\n\
echo ""\n\
echo "Config file contents:"\n\
cat _config.yml\n\
echo ""\n\
echo "Starting Jekyll server with baseurl=''"\n\
bundle exec jekyll serve --host 0.0.0.0 --baseurl="" --verbose\n\
' > /app/entrypoint.sh && chmod +x /app/entrypoint.sh

# Watch for changes and serve
CMD ["/app/entrypoint.sh"]