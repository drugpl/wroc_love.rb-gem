require 'geocoder'

module WrocLove
  class Airport < Struct.new(:code, :name, :location)

    TimeFormatRule = "%y%m%d".freeze

    class << self
      attr_accessor :airports
      private :airports, :airports=

      def store(*params)
        airports << new(*params).freeze
      end

      def nearest(location, count = 10)
        airports.sort_by{|a| Geocoder::Calculations.distance_between(a.location, location) }.first(count)
      end

    end
    
    self.airports = []

    def description
      "#{code.rjust(5)}    #{name.rjust(35)}     #{link}"
    end

    def link
      "http://www.skyscanner.net/flights/#{code.downcase}/wro/#{WrocLove::Arrival.strftime(TimeFormatRule)}/#{WrocLove::Return.strftime(TimeFormatRule)}"
    end
  end
end

require 'wroc_love/airports'