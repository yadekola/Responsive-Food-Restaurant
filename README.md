# Responsive Food Restaurant

A responsive restaurant landing page built with HTML, CSS, and vanilla JavaScript. The project includes food galleries, menu and review sections, an order form layout, and mobile navigation. It can be served locally or packaged as a small Nginx Docker image.

[![Build and publish Docker image](https://github.com/yadekola/Responsive-Food-Restaurant/actions/workflows/publish-image.yml/badge.svg)](https://github.com/yadekola/Responsive-Food-Restaurant/actions/workflows/publish-image.yml)

## Demo

View the live site: [yadekola.github.io/Responsive-Food-Restaurant](https://yadekola.github.io/Responsive-Food-Restaurant/)

## Features

- Responsive restaurant landing page with home, dishes, about, menu, reviews, and order sections.
- Mobile navigation and interactive sliders powered by Swiper.
- Food imagery, ratings, and Font Awesome icons.
- Docker image served by Nginx.
- GitHub Actions workflow to build and publish images to GitHub Container Registry (GHCR).

## Technology

- HTML5, CSS3, and vanilla JavaScript
- Nginx (Alpine Linux image)
- Docker and GitHub Actions
- External CDN assets: Swiper and Font Awesome

## Run locally

Clone the repository and open `index.html` in a browser. For a local web server, run:

```bash
python -m http.server 8000
```

Then visit [http://localhost:8000](http://localhost:8000).

## Build and run with Docker

From the repository root, build the image:

```bash
docker build -t responsive-food-restaurant:local .
```

Start the container and map port 8080 on your computer to port 80 in the container:

```bash
docker run --name restaurant-site --rm -p 8080:80 responsive-food-restaurant:local
```

Open [http://localhost:8080](http://localhost:8080). Stop the container with `Ctrl+C`.

To run in the background instead:

```bash
docker run -d --name restaurant-site -p 8080:80 responsive-food-restaurant:local
docker stop restaurant-site
docker rm restaurant-site
```

## Pull the published image

Images are published to GHCR when commits are pushed to `main` or a `v*` tag is pushed. Replace `yadekola` if using a fork:

```bash
docker pull ghcr.io/yadekola/responsive-food-restaurant:latest
docker run --rm -p 8080:80 ghcr.io/yadekola/responsive-food-restaurant:latest
```

The package may need to be made public in the GitHub package settings before anonymous users can pull it.

## CI/CD

The workflow in `.github/workflows/publish-image.yml` builds the image for pull requests and publishes it for pushes to `main`, version tags (`v*`), and manual workflow runs. It uses the repository's `GITHUB_TOKEN`; no Docker Hub credentials or extra repository secrets are required. The package is named `ghcr.io/<owner>/<repository>` and receives branch/tag, commit SHA, and (on the default branch) `latest` tags.

## Project structure

```text
.
├── .github/workflows/publish-image.yml
├── ccs/style.css
├── image/
├── js/script.js
├── Dockerfile
├── .dockerignore
└── index.html
```

## Notes

This repository contains a static front end. The order form is presentation only and does not submit orders to a backend. Swiper and Font Awesome are loaded from external CDNs, so those assets require network access in the visitor's browser.

## License

No `LICENSE` file is currently included. Add a license file before redistributing this project under an open-source license.

## Author

Created by Yakub Ojo.
