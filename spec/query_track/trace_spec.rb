RSpec.describe QueryTrack::Trace do
  let(:app_dir_path) { 'app/admin/user.rb' }
  let(:fake_trace) { [app_dir_path, 'lib/config/query_track.rb'] }

  before do
    QueryTrack::Settings.configure do |config|
      config.duration = 1.0
    end
  end

  context 'has default app directory' do
    it 'should return path matching app directory' do
      expect(QueryTrack::Trace.new(fake_trace).call).to eq app_dir_path
    end
  end

  context 'has override app directory' do
    let(:app_dir_path) { 'backend/models/user.rb' }

    before do
      QueryTrack::Settings.configure do |config|
        config.app_dir = 'backend'
      end
    end

    it 'should return path matching app directory' do
      expect(QueryTrack::Trace.new(fake_trace).call).to eq app_dir_path
    end
  end
end
