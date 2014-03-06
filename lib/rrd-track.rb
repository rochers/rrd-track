require "rrd-track/client"
require "rrd-track/configuration"
require "rrd-track/version"

module RRD
  class << self
    attr_writer :configuration

    def client
      @client ||= Client.new
    end

    def configuration
      @configuration ||= Configuration.new
    end

    def configure
      yield(configuration)
    end

    def track(tracking_number)
      client.request(RRD::Request::Tracking.new(tracking_number))
    end

    alias_method :config, :configuration
  end
end
