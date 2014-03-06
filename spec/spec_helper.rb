require 'awesome_print'
require 'rrd-track'
require 'webmock/rspec'

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.order = 'random'
  WebMock.disable_net_connect!(:allow_localhost => true)
end
