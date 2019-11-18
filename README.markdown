# Journal

[![Build Status](https://travis-ci.org/uhlig-it/journal.svg?branch=master)](https://travis-ci.org/uhlig-it/journal)

Simple HTTP server that serves journal entries from a Postgres DB.

# Development

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

# Troubleshooting

## Use the `sequel` database monitor

```command
$ bundle exec sequel $DB
```
