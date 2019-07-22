module QueryTrack
  class Filters
    attr_reader :full_trace

    def initialize(full_trace)
      @full_trace = full_trace
    end

    def call
      QueryTrack::Settings.config.filters.map do |filter| 
        full_trace.select { |v| v =~ %r{#{filter}} }[0].nil? 
      end.include?(false)
    end
  end
end
