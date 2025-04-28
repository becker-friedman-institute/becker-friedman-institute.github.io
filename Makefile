# Makefile for Becker Friedman Institute GitHub Pages site
# All commands run in Docker - no Ruby is needed on the host

.PHONY: build serve serve-detached stop clean

# Build the Docker image
build:
	docker build -t bfi-github-pages .

# Serve the website locally (interactive mode)
serve: build
	@echo "Starting Jekyll server at http://localhost:4000"
	@echo "Press Ctrl+C to stop"
	docker run --rm -p 4000:4000 bfi-github-pages

# Serve the website in detached mode
serve-detached: build
	@echo "Starting Jekyll server at http://localhost:4000"
	docker run --name bfi-site -d -p 4000:4000 bfi-github-pages
	@echo "Server running in background. Use 'make stop' to stop it."

# Stop the detached server
stop:
	docker stop bfi-site || true
	docker rm bfi-site || true

# Clean up Docker resources
clean: stop
	docker rmi bfi-github-pages || true