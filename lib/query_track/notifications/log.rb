module QueryTrack
  module Notifications
    class Log
      attr_reader :code, :duration, :webhook_url

      def initialize(code, duration)
        @code = code.strip
        @duration = duration
      end

      def call
        return unless QueryTrack::Settings.config.logs

        trace = QueryTrack::Trace.new(caller).call

        QueryTrack.logger.info "\n#{code}\nDuration: #{duration}s\nTrace: #{trace}"
      end
    end
  end
end
