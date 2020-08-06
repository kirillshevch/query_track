module QueryTrack
  class Trace
    attr_reader :full_trace

    def initialize(full_trace)
      @full_trace = full_trace
    end

    def call
      full_trace.select { |v| v =~ %r{#{QueryTrack::Settings.config.app_dir}/} }[0]
    end
  end
end
