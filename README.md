# ParamsModifier

A simple gem to filter, normalize and sanitize your parameters.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'params_modifier'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install params_modifier

## Usage

Create a param filter class and use `parameter` method, which requires 2 attributes: parameter name and block, which returns new value for this parameters.

```ruby
  # app/param_filters/user_params_filter.rb
  class UserParamsFilter < ParamsModifier::Base
    parameter(:email) { |value| value.downcase }
  end
```

Then call filter method on `ActionController::Parameters` and pass your filter class to it.

```ruby
  # app/controllers/users_controller.rb
  def user_params
    params.require(:user).permit(:name, :email).filter(UserParamsFilter)
  end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/thepry/params_modifier. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

