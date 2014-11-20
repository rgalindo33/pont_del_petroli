require 'spec_helper'

describe PontdelpetroliDataWrapper::PDPParser do

  let(:subject) { PontdelpetroliDataWrapper::PDPParser.new }

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

describe PontdelpetroliDataWrapper do
  let(:subject) { PontdelpetroliDataWrapper }

  describe '.now' do
    it 'returns the latest buoy data' do
      expect(subject.now).to be_a PontdelpetroliDataWrapper::SwellData
    end
  end

  describe '.history' do
    it 'returns all data available' do
      expect(subject.history).to be_a Array
    end
  end
end