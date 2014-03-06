require 'nokogiri'
require 'typhoeus'

require "rrd-track/errors"
require "rrd-track/request/tracking"
require "rrd-track/response/tracking"

module RRD
  class Client
    
    def request(request, &block)
      response = Typhoeus::Request.get(tracking_api_url, {
        timeout: RRD.config.timeout,
        params: request.api_params,
        headers: { Accept: "application/xml" }
      })

      # Parse the request
      xml = Nokogiri::XML.parse(response.body)

      if (error = xml.search('error')).any?
        code = error.search('code').text
        description = error.search('description').text

        raise Error.for_code(code).new(code, description)
      end

      request.response_handler(xml)
    end

    private
    
    def tracking_api_url
      "http://www.ppxtrack.com/api/ParcelTracking"
    end

  end
end