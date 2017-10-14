require 'airport'

describe Airport do
  plane = Plane.new

  describe '#land' do
    it { is_expected.to respond_to(:land).with(1).argument }

    it 'has the plane after its landed' do
      subject.land(plane)
      expect(subject.planes).to include plane
    end
  end

  describe '#take_off' do
    it { is_expected.to respond_to(:take_off).with(1).argument }

    it 'does not have the plane after it has taken off' do
      subject.land(plane)
      subject.take_off(plane)
      expect(subject.planes).to_not include plane
    end
  end
end
