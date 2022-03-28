module QueryTrack
  class Settings
    extend ::Dry::Configurable

    setting :duration

    setting :notifications do
      setting :slack, default: ''
      setting :custom_handler
    end

    setting :logs, default: false

    setting :filters, default: []

    setting :enabled, default: true

    setting :app_dir, default: 'app'
  end
end
