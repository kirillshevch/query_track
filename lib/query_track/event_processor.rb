module QueryTrack
  class EventProcessor
    attr_reader :event

    def initialize(event)
      @event = event
    end

    def call
      return unless QueryTrack::Settings.config.duration

      return if under_filter?(caller)

      if duration_seconds > QueryTrack::Settings.config.duration
        QueryTrack::Notifications::Slack.new(event.payload[:sql], duration_seconds).call
        QueryTrack::Notifications::Log.new(event.payload[:sql], duration_seconds).call
      end
    end

    private

    def duration_seconds
      event.duration / 1000
    end

    def under_filter?(trace)
      QueryTrack::Filters.new(caller).call
    end
  end
end
