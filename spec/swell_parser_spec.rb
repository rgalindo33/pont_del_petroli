require 'spec_helper'

describe PontDelPetroli::SwellParser do

  let(:subject) { PontDelPetroli::SwellParser.new }

  describe '#run' do

    let(:data) { subject.run }

    it 'returns an array' do
      expect(data).to be_an Array
    end

    it 'objects of the array are MeteoData' do
      expect(data.first).to be_a PontDelPetroli::SwellData
    end

    it 'returns only meaningfull data' do
      expect(data.all?).to be true
    end
  end

end