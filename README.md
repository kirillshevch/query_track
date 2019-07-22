# QueryTrack

[![Gem Version](https://badge.fury.io/rb/query_track.svg)](https://badge.fury.io/rb/query_track)
[![CircleCI](https://circleci.com/gh/kirillshevch/query_track.svg?style=svg)](https://circleci.com/gh/kirillshevch/query_track)

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

### SQL Duration Limit

Specify SQL duration query limit:

```ruby
QueryTrack::Settings.configure do |config|
  config.duration = 0.5
end
```

### Console Log

Enable console logs from config:

```ruby
QueryTrack::Settings.configure do |config|
  config.duration = 0.5
  config.logs = true
end
```

# <img src='https://github.com/kirillshevch/query_track/blob/master/examples/console.jpg' alt='Log Example' />

### Slack Notifications

To receive notifications about slow queries into Slack, you need to install [incoming-webhooks](https://reflow-files.slack.com/apps/A0F7XDUAZ-incoming-webhooks) and put link into config file:

```ruby
QueryTrack::Settings.configure do |config|
  config.duration = 0.5
  config.notifications.slack = 'https://hooks.slack.com/services/T0000000/B0000000/C0000000'
end
```

# <img src='https://github.com/kirillshevch/query_track/blob/master/examples/slack.jpg' alt='Incoming Hook Example' />

### Filters

`TODO`

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/kirillshevch/query_track.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
