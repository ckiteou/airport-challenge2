require 'airport'

describe Airport do
  jimmy = Plane.new('FR3129')

  describe '#land' do
    it { is_expected.to respond_to(:land).with(1).argument }

    it 'has the plane after its landed' do
      subject.land(jimmy)
      expect(subject.planes).to include jimmy
    end
  end

  describe '#take_off' do
    it { is_expected.to respond_to(:take_off).with(1).argument }

    it 'does not have the plane after it has taken off' do
      subject.land(jimmy)
      subject.take_off(jimmy)
      expect(subject.planes).to_not include jimmy
    end
  end
end
