require "pont_del_petroli/version"
require "swell/parser"
require "meteo/parser"

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
      Parser.new.run.first
    end

    def self.all
      Parser.new.run
    end
  end

  module Meteo
    def self.now      
      Parser.new.run.first
    end

    def self.all
      Parser.new.run
    end
  end

end
