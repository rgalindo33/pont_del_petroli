require 'spec_helper'

describe PontDelPetroli::PDPParser do

  let(:subject) { PontDelPetroli::PDPParser.new }

  describe '#run' do

    let(:data) { subject.run }

    it 'parses the site' do
      expect(data).to be_an Array
    end

    it 'returns only meaningfull data' do
      expect(data.all?).to be true
    end
  end

end

describe PontDelPetroli do
  let(:subject) { PontDelPetroli }

  describe '.now' do
    it 'returns the latest buoy data' do
      expect(subject.now).to be_a PontDelPetroli::SwellData
    end
  end

  describe '.all' do
    it 'returns all data available' do
      expect(subject.all).to be_a Array
    end
  end
end