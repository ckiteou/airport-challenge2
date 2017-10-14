require 'airport'

describe Airport do
  plane = Plane.new

  describe '#land' do

    it { is_expected.to respond_to(:land).with(1).argument }

    it 'instructs the plane to land' do
      subject.land(plane)
    end

    it 'has the plane after its landed' do
      subject.land(plane)
      expect(subject.planes).to include plane
    end
  end
end
