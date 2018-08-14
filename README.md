# docker Ruby on Rails

## Requirements

+ Docker
+ Docker Compose

## Whats this image contains:

+ Ruby 2.5.1
+ Rails 5.2.1
+ Bundler 1.16.3
+ Node 10.8.0
+ Npm 6.2.0

## Ports exposes

+ 3000
+ 3306
+ 80

## Instructions

+ clone this repository
+ start container `docker-compose up -d`
+ enter in container `docker exec -it CONTAINER_NAME /bin/bash`
+ revert to the initial state of the container
    + `docker-compose kill`
    + `docker-compose rm`
    + `docker-compose up -d`
