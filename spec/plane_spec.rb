require 'plane'

describe Plane do
  timmy = Plane.new('FR3129')

  describe '#change_flying_status' do
    it 'initializes in a state of not flying' do
      expect(timmy.flying).to eq false
    end

    it 'changes flying status to true' do
      timmy.change_flying_status
      expect(timmy.flying).to eq true
    end

    it 'changes flying status to not true' do
      timmy.change_flying_status
      expect(timmy.flying).to eq false
    end
  end

  describe '#registration' do
    it 'has a registration' do
      expect(timmy.registration).to eq 'FR3129'
    end
  end
end
