require 'spec_helper'

describe RRD do
  
  it "tracks shipped packages" do

    rrd_tracking_xml = File.read("#{Dir.pwd}/spec/rrd_api_responses/shipment_shipped.xml")

    WebMock.stub_request(:get, "http://www.ppxtrack.com/api/ParcelTracking?id=2043XXXXXX1513").
            with(headers: {'User-Agent'=>'Typhoeus - https://github.com/typhoeus/typhoeus'}).
            to_return(status: 200, body: rrd_tracking_xml)

    result = RRD::track('2043XXXXXX1513')

    expect(result).to   be_kind_of(RRD::Response::Tracking)
  end


  it "tracks shipped packages with two events" do

    rrd_tracking_xml = File.read("#{Dir.pwd}/spec/rrd_api_responses/shipment_shipped.xml")

    WebMock.stub_request(:get, "http://www.ppxtrack.com/api/ParcelTracking?id=2043XXXXXX1513").
            with(headers: {'User-Agent'=>'Typhoeus - https://github.com/typhoeus/typhoeus'}).
            to_return(status: 200, body: rrd_tracking_xml)

    result = RRD::track('2043XXXXXX1513')

    expect(result.tracking_events.count).to       eq(11)
    expect(result.tracking_events.first).to       be_kind_of(RRD::Response::TrackDetail)
  end


end