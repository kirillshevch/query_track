module QueryTrack
  class EventProcessor
    attr_reader :event, :subscriber

    def initialize(event, subscriber)
      @event = event
      @subscriber = subscriber
    end

    def call
      unsubscribe
      return unless QueryTrack::Settings.config.duration && QueryTrack::Settings.config.enabled

      return if under_filter?(caller)

      if duration_seconds > QueryTrack::Settings.config.duration
        QueryTrack::Notifications::Slack.new(event.payload[:sql], duration_seconds).call
        QueryTrack::Notifications::Log.new(event.payload[:sql], duration_seconds).call
        QueryTrack::Notifications::Custom.new(event.payload[:sql], duration_seconds).call
      end
    end

    private

    def unsubscribe
      return if QueryTrack::Settings.config.enabled

      ActiveSupport::Notifications.unsubscribe(subscriber)
    end

    def duration_seconds
      event.duration / 1000
    end

    def under_filter?(trace)
      QueryTrack::Filters.new(caller).call
    end
  end
end
