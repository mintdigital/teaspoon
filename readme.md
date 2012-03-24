# Teaspoon

Send messages to [Mint Source](https://github.com/mintdigital/mint-source)

## Installation

Add this line to your application's Gemfile:

    gem 'teaspoon'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install teaspoon

## Usage

### Standalone

```ruby
t = Teaspoon::Client.new('http://your-mint-source.com/endpoint', 'username', 'password') # Optional username & password
t.send('Main message', 'Sub-message', # message, submessage, options hash (which is optional, natch)
  :colour    => '#bada55', # Also accepts color if you're American
  :image     => 'http://farm6.static.flickr.com/5309/5623212581_5f8f3f8788.jpg',
  :timestamp => Time.now
)
```

### With Rails 3+

create a configuration file in `Rails.root + config/teaspoon.yml`. In it, configure Teaspoon::Client, like this:

```yaml
url: 'url: 'http://your-mint-source.com/endpoint'
username: 'http-auth-username'
password: 'http-auth-password'
```
Then, in your controller, you have the `spoon` helper method available:
```ruby
def index
  @users = User.all
  spoon("This is my message", "This is my submessage", :color => '#000')
end
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
