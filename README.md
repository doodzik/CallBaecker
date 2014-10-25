# CallBaecker

Intercepts method calls inorder to save arguments and to allow to terminate function from within a nested method

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'CallBaecker'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install CallBaecker

## Usage

```ruby
class Example
  # everything above here wont be intercepted
  include CallBaecker
  # everything beneath will

  # @__last_args := last method args

  # thrown(:CallBaeckerDone, value) := terminats methods and returns value
end
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/CallBaecker/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
