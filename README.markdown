# Journal

[![Build Status](https://travis-ci.org/uhlig-it/journal.svg?branch=master)](https://travis-ci.org/uhlig-it/journal)

Simple HTTP server that serves journal entries from a Postgres DB.

# Development

## Local

1. Source the `.envrc`, either using `direnv`, or manually with `source .envrc`.
1. Start the database server with `postgres`; the variables set in the previous step will make sure that the `postgres` directory is used.
1. Migrate the database:

   ```command
   bundle exec rake db:migrate
   ```

1. Run the app:

   ```command
   rerun bundle exec ruby app.rb
   ```

## Docker

```command
$ bundle exec rake docker:build
$ docker run -it --rm suhlig/journal
$ bundle exec rake docker:push
```

## Docker Compose

We do not rely on [proper service startup order](https://docs.docker.com/compose/startup-order/) as it would only complicate things.

```command
$ docker-compose up db
$ docker-compose run web bundle exec rake db:migrate
$ docker-compose up web
```

# Troubleshooting

## Use the `sequel` database monitor

```command
$ bundle exec sequel $DB
```
