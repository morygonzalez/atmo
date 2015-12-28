# Atmo

Very tiny Netatmo Weather Station client for Ruby.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'atmo'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install atmo

## Usage

### 1. Sign up with Netatmo Developers API

Before you use this gem, you need to sign up with Netatomo Development API and create Application.

[Netatmo Developers](https://dev.netatmo.com/)

### 2. Configure .env

Put your Netatmo Application `client_id` and `client_secret` to .env file. You also need Netatmo user credentials (email and password). Put them to .env file, too.

```sh
USERNAME=<YOUR NETATMO USERNAME GOES HERE>
PASSWORD=<YOUR NETATMO PASSWORD GOES HERE>
CLIENT_ID=<YOUR NETATMO APPLICATION CLIENT_ID GOES HERE>
CLIENT_SECRET=<YOUR NETATMO APPLICATION CLIENT_SECRET GOES HERE>
```

### 3. Write some code

```ruby
require 'atmo'

client = Atmo::Api.new
if client.authenticate            # Do authentication
  data = client.get_station_data  # Send request to GETSTATIONSDATA API
end
```

See sample application.

[seihin-weather][https://github.com/morygonzalez/seihin-weather]

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/atmo. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
