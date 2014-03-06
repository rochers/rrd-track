module RRD::Response
  class TrackDetail
    attr_accessor :description, 
                  :location, 
                  :timestamp

    def initialize(init)
      init.each_pair do |key, val|
        instance_variable_set('@' + key.to_s, val)
      end
    end

  end
end