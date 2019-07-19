ActiveSupport::Notifications.subscribe('sql.active_record') do |*args|
  event = ActiveSupport::Notifications::Event.new(*args)

  QueryTrack::EventProcessor.new(event).call
end
