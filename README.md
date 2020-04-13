# Rails Blog App
A simple CRUD for Blog app, created by [@nieltg](https://github.com/nieltg).

## Getting Started
These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.  

### Prerequisites
  You need these to be installed
- Ruby 2.7.0 (if you use Mac, you can use `rbenv`)
- Ruby on Rails (6.0.x.x)
- PostgreSQL 12.2 and PGAdmin 4
- Node 13.10.x and NPM 6.x.x
- Yarn 1.22.x
  
### Installing
1) Run `gem install`. You will see error because of missing dependencies.
2) Run `bundle install`.
3) Create Postgres role `blog` with `superuser` access.
4) Create database `blog_development` under Postgres role `blog`.
5) Migrate using this command: `rails db:migrate RAILS_ENV=development` if your environment is development.
  
## Running the tests
<!--- TODO: need contribution --->

### Break down into end to end tests
<!--- TODO: need contribution --->

### And coding style tests
<!--- TODO: need contribution --->
  
## Deployment
<!--- TODO: need contribution --->

## Versioning
We use [SemVer](http://semver.org/) for versioning.