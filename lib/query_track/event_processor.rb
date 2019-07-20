module QueryTrack
  class EventProcessor
    attr_reader :event

    def initialize(event)
      @event = event
    end

    def call
      return unless QueryTrack::Settings.config.duration

      if event.duration > QueryTrack::Settings.config.duration
        QueryTrack::Notifications::Slack.new(event.payload[:sql], event.duration).call
      end
    end
  end
end
