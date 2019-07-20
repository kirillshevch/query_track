# QueryTrack

Tool for finding time-consuming database queries for ActiveRecord-based Rails Apps. Provides Slack notifications for with backtrace, raw SQL, time duration, etc.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'query_track'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install query_track

## Usage

Specify SQL duration query limit

```ruby
QueryTrack::Settings.configure do |config|
  config.duration = 0.5
end
```

To receive notifications about slow queries into Slack, you need to install (incoming-webhooks)[https://reflow-files.slack.com/apps/A0F7XDUAZ-incoming-webhooks] and put link into config file:

```ruby
QueryTrack::Settings.configure do |config|
  config.duration = 0.5
  config.notifications.slack = 'https://hooks.slack.com/services/TC30EGPDJ/BL2BH3J8H/Cgzub9lmGlOI89GxExBM7EV'
end
```

# <img src='https://github.com/kirillshevch/query_track/blob/master/slack.jpg' alt='Incoming Hook Example' />

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/kirillshevch/query_track.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
