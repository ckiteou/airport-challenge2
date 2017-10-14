require 'airport'

describe Airport do
  let(:jimmy) { Plane.new('FR3129') }
  let(:imogen) { Plane.new('BA123') }

  describe '#land' do
    it { is_expected.to respond_to(:land).with(1).argument }

    it 'has the plane after its landed' do
      allow(subject.weather).to receive(:stormy?).and_return(false)
      subject.land(jimmy)
      expect(subject.planes).to include jimmy
    end

    it 'can land a different plane' do
      allow(subject.weather).to receive(:stormy?).and_return(false)
      subject.land(imogen)
      expect(subject.planes).to include imogen
    end

    it 'does not allow a plane to land if the weather is stormy' do
      allow(subject.weather).to receive(:stormy?).and_return(true)
      expect{subject.land(jimmy)}.to raise_error 'Plane cannot land as weather is too stormy'
    end
  end

  describe '#take_off' do

    it { is_expected.to respond_to(:take_off).with(1).argument }

    it 'does not have the plane after it has taken off' do
      allow(subject.weather).to receive(:stormy?).and_return(false)
      subject.land(jimmy)
      subject.take_off(jimmy)
      expect(subject.planes).to_not include jimmy
    end

    it 'can take-off a specific aircraft' do
      allow(subject.weather).to receive(:stormy?).and_return(false)
      subject.land(jimmy)
      subject.land(imogen)
      subject.take_off(imogen)
      expect(subject.planes).to_not include imogen
      expect(subject.planes).to include jimmy
    end

    it 'prevents the plane from taking off if the weather is stormy' do
      allow(subject.weather).to receive(:stormy?).and_return(false)
      subject.land(jimmy)
      allow(subject.weather).to receive(:stormy?).and_return(true)
      expect{subject.take_off(jimmy)}.to raise_error 'Plane cannot take off as weather is too stormy'
    end
  end
end
