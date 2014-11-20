require 'spec_helper'

describe PontDelPetroli do
  let(:subject) { PontDelPetroli }

  describe '.now' do
    it 'merges swell data and meteo data in a Data struct' do
      expect(subject.now).to respond_to :swell_data
      expect(subject.now).to respond_to :meteo_data
    end
  end

  describe '.all' do
    it 'merges swell data and meteo data in a Data struct' do
      expect(subject.all).to respond_to :swell_data
      expect(subject.all).to respond_to :meteo_data
    end
  end
end

describe PontDelPetroli::Swell do
  let(:subject) { PontDelPetroli::Swell }

  describe '.now' do
    it 'returns the latest buoy data' do
      expect(subject.now).to be_a PontDelPetroli::Swell::Data
    end
  end

  describe 'all' do
    it 'returns all data available' do
      expect(subject.all).to be_a Array
    end
  end
end

describe PontDelPetroli::Meteo do
  let(:subject) { PontDelPetroli::Meteo }

  describe '.now' do
    it 'returns the latest buoy data' do
      expect(subject.now).to be_a PontDelPetroli::Meteo::Data
    end
  end

  describe 'all' do
    it 'returns all data available' do
      expect(subject.all).to be_a Array
    end
  end
end
