[![Docker Image Version](https://img.shields.io/docker/v/ls250824/run-website-apache-picsum?sort=semver)](https://hub.docker.com/r/ls250824/run-website-apache-picsum)

# run-website-apache-picsum

## Synopsis

Load random picture from picsum and display it as a webpage.

## Project structure

```text
run-website-apache-picsum/
├── public/                  # Static web content (served by Apache)
│   └── index.html           # Main HTML page with Picsum image loading
├── Dockerfile               # Docker build file for Apache + your site
├── docker-compose.yml       # Docker Compose file for quick run/start
├── build-docker.py          # Optional script to build & push Docker images
```

## Available Images

### Image (apache)

Base Image: httpd:2.4

#### Custom Build

```bash
docker pull ls250824/run-website-apache-picsum:<version>
```

## Usage Flow Summary

```bash
cd run-website-apache-picsum
```

### Build locally

```bash
docker build -t run-website-apache-picsum .
docker run -d -p 8080:80 run-website-apache-picsum
```

### Or with Compose

```bash
docker compose build
docker compose up
```

### Build and push for multiarch

```bash
docker buildx create --name multiarch-builder --use
docker buildx inspect --bootstrap
```

```bash
docker buildx build --platform linux/amd64,linux/arm64 -t <username>/run-website-apache-picsum:<version> -f Dockerfile   --push  .
```

## Port Mapping

| Internal Container Port | Exposed Host Port | Description                                 |
|-------------------------|-------------------|---------------------------------------------|
| 80                      | 8080              | Apache serves the website on port 80 inside the container, exposed on port 8080 |

## To push to Docker Hub (via script)

| Option         | Description                                         | Default                |
|----------------|-----------------------------------------------------|------------------------|
| `--username`   | Docker Hub username                                 | Current user           |
| `--tag`        | Tag to use for the image                            | Today's date           |
| `--latest`     | If specified, also tags and pushes as `latest`      | Not enabled by default |

Run the following command to clone the repository and build the image:

```bash
git clone https://github.com/jalberty2018/run-website-apache-picsum.git
cp run-website-apache-picsum/build-docker.py ..

python3 build-docker.py \
--username=<your_dockerhub_username> \
--tag=<custom_tag> \ 
run-website-apache-picsum
```

Note: If you want to push the image with the latest tag, add the --latest flag at the end.
