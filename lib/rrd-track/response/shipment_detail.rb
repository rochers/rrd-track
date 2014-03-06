module RRD::Response
  class ShipmentDetail
    attr_accessor :airway_bill, 
                  :tracking_number, 
                  :location, 
                  :status, 
                  :vendor_code, 
                  :vendor_name, 
                  :is_courier

    def initialize(init)
      init.each_pair do |key, val|
        instance_variable_set('@' + key.to_s, val)
      end
    end
    
  end
end