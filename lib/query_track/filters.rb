module QueryTrack
  class Filters
    attr_reader :full_trace

    def initialize(full_trace)
      @full_trace = full_trace
    end

    def call
      QueryTrack::Settings.config.filters.find do |filter|
        full_trace.select { |v| v =~ /#{filter}/ }[0]
      end
    end
  end
end
