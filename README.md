# run-website-apache-picsum

## Synopsis

Load random picture from picsum and display it as a webpage.

## Available Images

### Image (apache)

Base Image: httpd:2.4

#### Custom Build

```bash
docker pull ls250824/run-website-apache-picsum:25042025
```

## Build Manual

```bash
cd run-website-apache-picsum
```

### Build Docker image

```bash
docker build -t run-website-apache-picsum .
```

## Run the container

```bash
docker run -d -p 8080:80 run-website-apache-picsum
```

## Build and run with docker compose

```bash
docker compose -f docker-compose.yml build
docker compose up 
```

## Website

- [Local Website](http://localhost:8080)

## Build and push to hub.docker.com

### `build-docker.py` script options

| Option         | Description                                         | Default                |
|----------------|-----------------------------------------------------|------------------------|
| `--username`   | Docker Hub username                                 | Current user           |
| `--tag`        | Tag to use for the image                            | Today's date           |
| `--latest`     | If specified, also tags and pushes as `latest`      | Not enabled by default |

Run the following command to clone the repository and build the image:

```bash
git clone https://github.com/jalberty2018/run-website-apache-picsum.git

python3 run-website-apache-picsum/build-docker.py \
--username=<your_dockerhub_username> \
--tag=<custom_tag> \ 
run-website-apache-picsum
```

Note: If you want to push the image with the latest tag, add the --latest flag at the end.
