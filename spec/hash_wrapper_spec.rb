require 'hash_wrapper'

describe HashWrapper do
  subject { described_class.new }
  describe '#data' do
    context 'by default' do
      it 'returns a hash' do
        expect(subject.data).to be_a(Hash)
      end
    end
  end
  describe '#set' do
    let(:params) { { 'apple' => 'golden' } }
    it 'set a pair into the data' do
      subject.set(params)
      expect(subject.data['apple']).to eq('golden')
    end
  end
end
