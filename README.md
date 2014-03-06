# RRD Track Gem

[![Build Status](https://travis-ci.org/rochers/rrd-track.png?branch=master)](https://travis-ci.org/rochers/rrd-track) [![Code Climate](https://codeclimate.com/github/rochers/rrd-track.png)](https://codeclimate.com/github/rochers/rrd-track)

Track packages through the RR Donnelley API.

## Installation

Add this line to your application's Gemfile:

    gem 'rrd-track'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rrd-track

## Usage
Tracking packages is easy. Once configured, simply call track and pass your tracking number.

    RRD::track('RRDXXXXXXXXXXXXXXXX')

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request