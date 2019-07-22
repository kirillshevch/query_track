module QueryTrack
  class EventProcessor
    attr_reader :event

    def initialize(event)
      @event = event
    end

    def call
      return unless QueryTrack::Settings.config.duration

      return if under_filter?(caller)

      if event.duration > QueryTrack::Settings.config.duration
        QueryTrack::Notifications::Slack.new(event.payload[:sql], event.duration).call
        QueryTrack::Notifications::Log.new(event.payload[:sql], event.duration).call
      end
    end

    private

    def under_filter?(trace)
      QueryTrack::Filters.new(caller).call
    end
  end
end
