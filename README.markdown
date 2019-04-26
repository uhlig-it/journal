# Journal

[![Build Status](https://travis-ci.org/uhlig-it/journal.svg?branch=master)](https://travis-ci.org/uhlig-it/journal)

Simple HTTP server that serves journal entries from a Postgres DB.

# Development

```bash
# create the database
initdb -D /usr/local/var/postgres-10

# start the database server
postgres -D /usr/local/var/postgres-10

# create the dev database
createdb journal

# configure the DB URI
export DB=postgres://localhost/journal

# migrate the database
bundle exec rake db:migrate

# configure the HTTP port
export PORT=4567

# run the app
rerun bundle exec ruby app.rb
```

# Troubleshooting

## Use the `sequel` database monitor

```bash
$ bundle exec sequel $DB
```
