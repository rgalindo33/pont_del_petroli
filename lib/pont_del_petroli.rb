require "pont_del_petroli/version"

module PontDelPetroli
  
  def self.now
    {
      swell_data: Swell.now,
      meteo_data: Meteo.now
    }
  end

  def self.all
    {
      swell_data: Swell.all,
      meteo_data: Meteo.all
    }
  end

  module Swell
    def self.now
      SwellParser.new.run.first
    end

    def self.all
      SwellParser.new.run
    end
  end

  module Meteo
    def self.now      
      MeteoParser.new.run.first
    end

    def self.all
      MeteoParser.new.run
    end
  end

end
