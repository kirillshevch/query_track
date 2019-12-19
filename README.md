# QueryTrack

[![Gem Version](https://badge.fury.io/rb/query_track.svg)](https://badge.fury.io/rb/query_track)
[![CircleCI](https://circleci.com/gh/kirillshevch/query_track.svg?style=svg)](https://circleci.com/gh/kirillshevch/query_track)
[![Maintainability](https://api.codeclimate.com/v1/badges/15b0a6c0a1838b216db8/maintainability)](https://codeclimate.com/github/kirillshevch/query_track/maintainability)

Tool for finding time-consuming database queries for ActiveRecord-based Rails Apps. Provides Slack notifications with backtrace, raw SQL, time duration, etc.

## Installation

Add this line to your application's `Gemfile` and then execute `bundle install`:

```ruby
gem 'query_track'
```

## Usage

### SQL Duration Limit

Specify SQL duration query limit (in seconds):

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

### Filters

To avoid noisy warnings from used gems, and places where fat queries are justified, you can filters SQL by backtrace. 
For example, you have installed `activeadmin` and want to skip everything from `app/admin`:

```ruby
QueryTrack::Settings.configure do |config|
  config.duration = 0.5
  config.filters = ['app/admin']
end
```

### Enable/Disable toggle

Enable/disable with ENV variables to turn it on/off without code push. By default *QueryTrack* is enabled. 

```ruby
QueryTrack::Settings.configure do |config|
  config.duration = 0.5
  config.enabled = ENV['QUERY_TRACK_ENABLED']
end
```

### Slack Notifications

To receive notifications about slow queries into Slack, you need to install [incoming-webhooks](https://slack.com/apps/A0F7XDUAZ-incoming-webhooks) and put link into config file:

```ruby
QueryTrack::Settings.configure do |config|
  config.duration = 0.5
  config.notifications.slack = 'https://hooks.slack.com/services/T0000000/B0000000/C0000000'
end
```

# <img src='https://github.com/kirillshevch/query_track/blob/master/examples/slack.jpg' alt='Incoming Hook Example' />

## Production Usage Notes

When [QueryTrack](https://github.com/kirillshevch/query_track/blob/master/lib/query_track/notifications/slack.rb#L21) send slack hooks, request is executed in separate thread. So there should be no synchronous delays.

Subscription to SQL events and checking duration time actually take insignificant time in milliseconds.

If your project is horizontally scaled, you can install `query_track` for one of the node to avoid performance degrade for whole application.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/kirillshevch/query_track.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
