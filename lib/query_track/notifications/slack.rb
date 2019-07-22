module QueryTrack
  module Notifications
    class Slack
      attr_reader :code, :duration, :webhook_url

      def initialize(code, duration)
        @code = code.strip
        @duration = duration
        @webhook_url = QueryTrack::Settings.config.notifications.slack
      end

      def call
        return if webhook_url.nil? || webhook_url.empty?

        slack_hook = SlackHook::Incoming.new(webhook_url)

        trace = QueryTrack::Trace.new(caller).call

        payload = { blocks: blocks(trace) }

        slack_hook.post(payload)
      end

      private

      def blocks(trace)
        [
          {
            "type": 'divider'
          },
          {
            "type": 'section',
            "text": {
              "type": 'mrkdwn',
              "text": "```#{code}```"
            }
          },
          {
            "type": 'context',
            "elements": [
              {
                "type": 'mrkdwn',
                "text": "Duration: *#{duration}s* "
              }
            ]
          },
          {
            "type": 'context',
            "elements": [
              {
                "type": 'mrkdwn',
                "text": "#{trace}"
              }
            ]
          }
        ]
      end
    end
  end
end
