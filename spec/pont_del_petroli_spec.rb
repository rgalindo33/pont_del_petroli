require 'spec_helper'

describe PontDelPetroli do
  let(:subject) { PontDelPetroli }

  describe '.now' do
    it 'merges swell data and meteo data in a hash' do
      expect(subject.now).to have_key :swell_data
      expect(subject.now).to have_key :meteo_data
    end
  end

  describe '.all' do
    it 'merges swell data and meteo data in a hash' do
      expect(subject.all).to have_key :swell_data
      expect(subject.all).to have_key :meteo_data
    end

    it 'has an array of data on each key' do
      expect(subject.all.fetch(:swell_data)).to be_a Array
      expect(subject.all.fetch(:meteo_data)).to be_a Array
    end
  end
end

describe PontDelPetroli::Swell do
  let(:subject) { PontDelPetroli::Swell }

  describe '.now' do
    it 'returns the latest buoy data' do
      expect(subject.now).to be_a PontDelPetroli::SwellData
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
      expect(subject.now).to be_a PontDelPetroli::MeteoData
    end
  end

  describe 'all' do
    it 'returns all data available' do
      expect(subject.all).to be_a Array
    end
  end
end
