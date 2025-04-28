# Becker Friedman Institute GitHub Pages

This repository contains the code for the Becker Friedman Institute's GitHub Pages site. The site is built using Jekyll and served using Docker.

## Requirements

- Docker
- Make

## Usage

### Building the Site

To build the Docker image:

```
make build
```

### Serving the Site Locally

To serve the site locally on http://localhost:4000:

```
make serve
```

### Cleaning Up

To remove the Docker image:

```
make clean
```

## Development

All commands run inside Docker, as the host does not run Ruby. The Makefile provides convenient commands for building and serving the site.

## Structure

- `_layouts/`: Contains the HTML templates
- `assets/css/`: Contains the CSS files
- `index.html`: The homepage
- `Dockerfile`: Docker configuration
- `Makefile`: Make commands

## License

See the LICENSE file for details.