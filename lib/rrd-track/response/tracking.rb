module RRD::Response
  class Tracking
    require 'rrd-track/response/shipment_detail'
    require 'rrd-track/response/track_detail'
    
    attr_accessor :tracking_events, :shipment_detail

    def initialize(xml)
       @shipment_detail = parse_shipment_detail(xml.search("ParcelTrackingViewModel"))
       @tracking_events = []
       xml.search("StopDetailViewModel").each do |event|
         @tracking_events << parse_tracking_detail(event)
       end
     end
     
     private
     
     def parse_shipment_detail(node)
      RRD::Response::ShipmentDetail.new(
        {
          airway_bill:        node.search('AirwayBill').text, 
          tracking_number:    node.search('TrackingNumber').text, 
          location:           node.search('Location').text, 
          status:             node.search('Status').text,  
          vendor_code:        node.search('VendorCode').text,  
          vendor_name:        node.search('VendorName').text,
          is_courier:         node.search('IsCourier').text
        }
      )
     end

     def parse_tracking_detail(node)
      RRD::Response::TrackDetail.new(
        {
         description:   node.search('Description').text,
         location:      node.search('Location').text,
         timestamp:     node.search('TimeStamp').text
        }
      )
     end

  end
end