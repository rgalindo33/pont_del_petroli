require 'open-uri'
require 'nokogiri'

module PontDelPetroli
 class SwellParser
    DATA_URL          = 'http://www.pontdelpetroli.org/oceano.aspx'
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

      timestamp = Time.parse row.css('td:nth-child(1)').text
      height    = row.css('td:nth-child(4)').text
      direction = row.css('td:nth-child(5)').text
      period    = row.css('td:nth-child(6)').text

      SwellData.new timestamp, height, direction, period
    end

    def is_empty? row
      row.css('td:nth-child(4)').text == EMPTY_CHAR
    end
  end

  class SwellData < Struct.new :timestamp, :height, :direction, :period
  end
end