[ ![Codeship Status for rafaelBadan/OBC_currencyConversion](https://app.codeship.com/projects/ea98aee0-8222-0135-4f11-0268edf0f044/status?branch=master)](https://app.codeship.com/projects/247167)

## Introduction
Making use of the [Fixer.io](http://fixer.io/) API, the **Currency Conversion App** is a simple tool to easily convert any kind of currency to another.

**[Visit the app in Heroku](https://onebitcode-currencyconversion.herokuapp.com/)**

## Features
* Selection of currencies from a dropdown or text input search
* Input the amount in the desired currency, obtaining the immediately amount in the other selected currency.
* Swap currencies convertion between each other.

## Technologies
* [Docker](https://docs.docker.com/get-started/)
* [PostgreSQL](https://www.postgresql.org/)
* [Ruby on Rails](http://rubyonrails.org/)
* [TDD aproach](https://en.wikipedia.org/wiki/Test-driven_development)
* [CodeShip (for CI)](https://codeship.com/)


## Setup

At first, you need to setup some configurations after clonning the repo to your local machine.

### 1. Database

If you want to use, your first step must be create your `database.yml` with the following content

```yaml
default: &default
  adapter: postgresql
  encoding: unicode
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  host: postgres
  username: postgres

development:
  <<: *default
  database: obccurrencyconversion_development

test:
  <<: *default
  database: obccurrencyconversion_test

production:
  <<: *default
  database: obccurrencyconversion_production

```

### 2. Docker setup

 As we use docker, we have a `docker-compose.yml` for it.

 After creating this file, run the following commands:

 ```sh
 1. docker-compose build
 2. docker-compose run --rm website bundle install
 3. docker-compose run --rm website bundle exec rails db:create
 4. docker-compose run --rm website bundle exec rails db:migrate
 5. docker-compose up
