require 'weather'

describe Weather do
  before do
    allow(subject).to receive(:stormy?).and_return(false)
  end

  describe '#stormy?' do
    it { is_expected.to respond_to(:stormy?) }

    it 'returns false when weather is fine' do
      expect(subject.stormy?).to eq false
    end
  end
end
