RSpec.describe QueryTrack::Notifications::Custom do
  let(:code) { 'COMMIT' }
  let(:duration) { 5 }

  subject { described_class.new(code, duration) }

  context 'custom handler not specified' do
    before do
      QueryTrack::Settings.configure do |config|
        config.duration = 1.0
      end
    end

    it 'should not return anything' do
      expect(subject.call).to be_nil
    end
  end

  context 'custom handler specified' do
    before do
      QueryTrack::Settings.configure do |config|
        config.duration = 1.0
        config.notifications.custom_handler = -> (sql, duration, trace) {}
      end
    end

    it 'should call custom handler' do
      expect(QueryTrack::Settings.config.notifications.custom_handler).to receive(:call)
      subject.call
    end
  end
end
