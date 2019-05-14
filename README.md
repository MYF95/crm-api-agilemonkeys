# README

This is a synthetic API project done in Ruby on Rails. It is a REST API to manage customer data for a small shop as the backside end.

Ruby version: 2.6.3

To install and run in local:

1. Download or clone the repository
2. Make sure you have the right ruby version
3. Bundle install gems
4. Migrate any pending migrations to the database with `rails db:migrate`
5. Run `rails db:seed` to generate the default admin user
6. Start the server and you're good to go!

An initial admin user is generated when we run `db:seed` to be able to use the system:
email: admin@test.com
password: password

All of the documentation regarding the resources available will be inside the [wiki](https://github.com/MYF95/crm-api-agilemonkeys/wiki) of the project.

Running tests: \
We are using rspec as our main test tools \
Run `bundle exec rspec` to run the test suite.
