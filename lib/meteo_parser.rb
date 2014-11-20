require 'open-uri'
require 'nokogiri'

module PontDelPetroli
 class MeteoParser
    DATA_URL          = 'http://www.pontdelpetroli.org/ultimes24.aspx'
    CSS_ROWS_SELECTOR = '#contenidos table#ctl00_ContentPlaceHolder1_Gridview1 tr'
    EMPTY_CHAR        = "\u00A0"

    def run
      rows = Nokogiri::HTML(open(DATA_URL)).css CSS_ROWS_SELECTOR
      
      rows.drop(1).map do |row|
        extract_data_from row
      end.compact
    end

  private

    def extract_data_from row
      return if is_empty? row

      timestamp      = Time.parse row.css('td:nth-child(1)').text
      temperature    = row.css('td:nth-child(2)').text
      rain           = row.css('td:nth-child(4)').text
      wind_speed     = row.css('td:nth-child(5)').text
      wind_direction = row.css('td:nth-child(6)').text

      MeteoData.new timestamp, temperature, rain, wind_speed, wind_direction
    end

    def is_empty? row
      row.css('td:nth-child(2)').text == EMPTY_CHAR
    end
  end

  class MeteoData < Struct.new :timestamp, :temperature, :rain, :wind_speed, :wind_direction
  end
end