require 'airport'

describe Airport do
  let(:jimmy) { double :plane }
  let(:imogen) { double :plane }

  before do
    allow(subject.weather).to receive(:stormy?).and_return(false)
  end

  describe '#land' do
    it { is_expected.to respond_to(:land).with(1).argument }

    it 'has the plane after its landed' do
      subject.land(jimmy)
      expect(subject.planes).to include jimmy
    end

    it 'can land a different plane' do
      subject.land(imogen)
      expect(subject.planes).to include imogen
    end

    it 'does not allow a plane to land if the weather is stormy' do
      allow(subject.weather).to receive(:stormy?).and_return(true)
      message = 'Plane cannot land as weather is too stormy'
      expect { subject.land(jimmy) }.to raise_error message
    end

    it 'does not allow a plane to land if the capacity is full' do
      subject.capacity.times { subject.land(jimmy) }
      message = 'Plane cannot land as capacity is full'
      expect { subject.land(jimmy) }.to raise_error message
    end
  end

  describe '#take_off' do
    before do
      allow(jimmy).to receive(:change_flying_status)
      allow(imogen).to receive(:change_flying_status)
    end

    it { is_expected.to respond_to(:take_off).with(1).argument }

    it 'does not have the plane after it has taken off' do
      subject.land(jimmy)
      subject.take_off(jimmy)
      expect(subject.planes).to_not include jimmy
    end

    it 'can take-off a specific aircraft' do
      subject.land(jimmy)
      subject.land(imogen)
      subject.take_off(imogen)
      expect(subject.planes).to_not include imogen
      expect(subject.planes).to include jimmy
    end

    it 'prevents the plane from taking off if the weather is stormy' do
      subject.land(jimmy)
      allow(subject.weather).to receive(:stormy?).and_return(true)
      message = 'Plane cannot take off as weather is too stormy'
      expect { subject.take_off(jimmy) }.to raise_error message
    end
  end

  describe 'set_capacity' do
    it 'can set the default capacity on instantiation' do
      cartman = Airport.new(50)
      expect(cartman.capacity).to eq 50
    end

    it 'can change the default capacity' do
      subject.capacity = 100
      expect(subject.capacity).to eq 100
    end
  end
end
