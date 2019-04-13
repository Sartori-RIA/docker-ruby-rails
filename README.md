# docker Ruby on Rails

## Requirements

+ Docker
+ Docker Compose

## Whats this image contains:


+ NVM
    + Node latest
    + Npm latest

+ Ruby
    + Ruby 2.4.6
    + Rails latest
    + Bundler latest

+ Front-end
    + Typescript
    + Sass

## Ports exposes

+ 80
+ 3000
+ 3306
+ 4200

## Docker Compose

```yml

version: "3.1"

services:
  webapp:
    image: lucassartori/docker-ruby-rails
    container_name: my_rails_app
    ports:
      - 3000:3000
    volumes:
      - .:/var/www
    tty: true
    links:
      - db

  db:
    image: postgres
    container_name: my_rails_db
    ports:
      - 5432:5432
    volumes:
      - ./db:/var/lib/postgresql/data
    tty: true
    environment:
      - POSTGRES_PASSWORD=postgres
      - POSTGRES_USER=postgres

  adminer:
    image: adminer
    container_name: rails_adminer
    ports:
      - 8080:8080
```