module RRD::Request
  class Tracking

    attr_accessor :tracking_number
    
    def initialize(tracking_number)
      @tracking_number = tracking_number
    end

    def api_params
      {
        id: tracking_number
      }
    end

    def response_handler(xml)
      RRD::Response::Tracking.new(xml)
    end
  
  end
end