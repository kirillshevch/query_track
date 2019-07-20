require 'dry-configurable'
require 'active_support/notifications'
require 'slack_hook'
require 'query_track/version'
require 'query_track/settings'
require 'query_track/notifications/slack'
require 'query_track/event_processor'
require 'subscriber'

module QueryTrack
  class Error < StandardError; end
  # Your code goes here...
end
