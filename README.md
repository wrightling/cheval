# CHEVAL Spree Store

## Docker Setup

The Dockerfile for this rails app will install the Spree prerequisites from Spree's [getting started guide](https://guides.spreecommerce.org/developer/getting_started_tutorial.html#creating-the-rails-application) - rails, bundler, image magick.

```
docker-compose build
```

## Database Setup

Spree migrations have already been generated and simply need to be run after database creation.

```
docker-compose run --rm web bundle exec rake db:create
docker-compose run --rm web bundle exec rake db:migrate
docker-compose run --rm web bundle exec rake db:seed

# Run this one if you want Spree's sample data as well
docker-compose run --rm web bundle exec rake spree_sample:load
```
