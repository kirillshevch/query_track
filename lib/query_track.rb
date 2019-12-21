require 'dry-configurable'
require 'active_support/notifications'
require 'slack_hook'
require 'query_track/version'
require 'query_track/settings'
require 'query_track/trace'
require 'query_track/filters'
require 'query_track/notifications/custom'
require 'query_track/notifications/slack'
require 'query_track/notifications/log'
require 'query_track/event_processor'
require 'subscriber'
require 'logger'

module QueryTrack
  class << self
    attr_writer :logger

    def logger
      @logger ||= Logger.new($stdout).tap do |log|
        log.progname = self.name
      end
    end
  end
end
