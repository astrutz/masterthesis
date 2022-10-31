[![CodeQL](https://github.com/astrutz/masterthesis/actions/workflows/codeql-analysis.yml/badge.svg)](https://github.com/astrutz/masterthesis/actions/workflows/codeql-analysis.yml)
[![Ruby on Rails CI](https://github.com/astrutz/masterthesis/actions/workflows/rubyonrails.yml/badge.svg)](https://github.com/astrutz/masterthesis/actions/workflows/rubyonrails.yml)
[![Release](https://img.shields.io/github/v/release/astrutz/masterthesis?display_name=release&label=Aktuelles%20Release)](https://github.com/astrutz/masterthesis/releases)

# Pay2Mail

[pay2mail.org](https://pay2mail.org)

Pay2Mail is a system developed to prioritize emails with payments and generating an pre-sorted inbox for recipients.

## Prerequisites
* `ruby = 3.0.2`
* `rails >= 7.0.3.1`
* `sqlite ~> 1.4`
* `node = 18.8.0`
* `yarn = 1.22.19`

## Install

### Clone the repository

```shell
git clone git@github.com:astrutz/masterthesis.git
cd project
```

### Check your Ruby version

```shell
ruby -v
```

The output should start with something like `ruby 3.0.2`

If not, install the right ruby version using [rbenv](https://github.com/rbenv/rbenv) (it could take a while):

```shell
rbenv install 3.0.2
```

### Initialize the database

```shell
rails db:create db:migrate db:seed
```

## Serve

```shell
rails s
```

## Testing
Unit tests for models are implemented under `/test/models` and integration tests are implemented under `test/controllers/`. To run these tests:

```shell
rails t
```

## CI/CD

### GitHub Actions
Two workflows are triggered every time there is a push or pull request on `master`. [CodeQL](https://github.com/astrutz/masterthesis/actions/workflows/codeql-analysis.yml) runs an analysis checking for potential security or performance problems. [Ruby on Rails CI](https://github.com/astrutz/masterthesis/actions/workflows/rubyonrails.yml) runs the test suite and uses `rubocop` to detect code quality problems.

### Deployment to DigitalOcean
This project is hosted via [DigitalOcean App Platform](https://www.digitalocean.com/products/app-platform). Every push on `master` triggers a new deployment, which is deployed to [pay2mail.org](https://pay2mail.org). Furthermore every push on `prototype` triggers a new deployment, which is deployed to [proto.pay2mail.org](https://proto.pay2mail.org).
