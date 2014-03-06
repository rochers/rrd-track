module RRD
  class Configuration
    attr_accessor :timeout

    def initialize
      @timeout  = 5000
    end
  end
end