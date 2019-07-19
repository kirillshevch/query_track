RSpec.describe QueryTrack::Notifications::Slack do
  let(:code) { 'COMMIT' }
  let(:duration) { 5 }

  before do
    QueryTrack::Settings.configure do |config|
      config.duration = 1.0
      config.notifications.slack = 'https://hooks.slack.com/services/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'
    end
  end

  pending 'it should post notification to slack'
end
