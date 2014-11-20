require "pont_del_petroli/version"
require "swell/parser"
require "meteo/parser"

module PontDelPetroli
  
  def self.now
    Data.new Swell.now, Meteo.now
  end

  def self.all
    Data.new Swell.all, Meteo.all
  end

  class Data < Struct.new :swell_data, :meteo_data
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
