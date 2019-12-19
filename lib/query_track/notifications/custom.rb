module QueryTrack
  module Notifications
    class Custom
      attr_reader :code, :duration

      def initialize(code, duration)
        @code = code.strip
        @duration = duration
      end

      def call
        return unless QueryTrack::Settings.config.notifications.custom_handler

        trace = QueryTrack::Trace.new(caller).call

        QueryTrack::Settings.config.notifications.custom_handler.call(code, duration, trace)
      end
    end
  end
end
