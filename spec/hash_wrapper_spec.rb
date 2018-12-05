require 'hash_wrapper'

describe HashWrapper do
  subject { described_class.new }
  describe '#data' do
    context 'by defaault' do
      it 'returns a hash' do
        expect(subject.data).to be_a(Hash)
      end
    end
  end
end
