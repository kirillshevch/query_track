RSpec.describe QueryTrack::Filters do
  let(:fake_trace) { ['app/admin/user.rb', 'lib/config/query_track.rb'] }

  context 'has content under filter' do
    before do
      QueryTrack::Settings.configure do |config|
        config.duration = 1.0
        config.filters = ['app/admin']
      end
    end

    it 'should return true' do
      expect(QueryTrack::Filters.new(fake_trace).call).to be_truthy
    end
  end

  context 'has no content under filter' do
    before do
      QueryTrack::Settings.configure do |config|
        config.duration = 1.0
        config.filters = ['app/models']
      end
    end

    it 'should return true' do
      expect(QueryTrack::Filters.new(fake_trace).call).to be_falsey
    end
  end
end
