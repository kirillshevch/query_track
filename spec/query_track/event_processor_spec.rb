RSpec.describe QueryTrack::EventProcessor do
  let(:payload) do ['sql.active_record', Time.now, Time.now, '1e07319',
    {
      sql: "SET client_min_messages TO 'warning'",
      name: 'SCHEMA',
      binds: [],
      type_casted_binds: [],
      statement_name: nil,
      connection_id: 1
    }
  ] end

  let!(:event) { ActiveSupport::Notifications::Event.new(*payload) }

  subject { described_class.new(event) }

  context 'skipping case' do
    it 'should return if duration not specified' do
      expect(event).not_to receive(:duration)
      subject.call
    end
  end
  
  context 'processing' do
    before do
      QueryTrack::Settings.configure do |config|
        config.duration = 1.0
        config.logs = true
      end
    end

    it 'should process event if duration specified' do
      allow(event).to receive(:duration).and_return(1)
      expect(event).to receive(:duration)
      subject.call
    end

    it 'should call logs if enabled' do
      allow(event).to receive(:duration).and_return(5)
      mock_logger = double('log')
      allow(mock_logger).to receive(:call)
      expect(QueryTrack::Notifications::Log).to receive(:new).and_return(mock_logger)
      subject.call
    end
  end
end
