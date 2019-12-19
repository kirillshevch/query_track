module QueryTrack
  class Settings
    extend ::Dry::Configurable

    setting :duration

    setting :notifications do
      setting :slack, ''
      setting :custom_handler
    end

    setting :logs, false

    setting :filters, []

    setting :enabled, true
  end
end
