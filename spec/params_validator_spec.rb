require 'params_validator'

describe ParamsValidator do
  describe '.validate' do
    context 'invalid params' do
      it 'returns nil if parameters are nil' do
        empty_params = {}
        expect(described_class.validate(empty_params)).to eq(nil)
      end

      it 'returns nil if parameters are all invalid' do
        invalid_params = { 'invalid' => nil }
        expect(described_class.validate(invalid_params)).to eq(nil)
      end

      it 'returns nil if values are empty strings' do
        invalid_params = { 'invalid' => '' }
        expect(described_class.validate(invalid_params)).to eq(nil)
      end

      it 'returns only valid pairs' do
        mixed_params = { 'invalid' => nil, 'valid' => 'value' }
        result = described_class.validate(mixed_params)
        expect(result.keys.size).to eq(1)
      end
    end

    context 'valid params' do
      it 'returns a hash if parameters are valid' do
        empty_params = { 'key' => 'value' }
        expect(described_class.validate(empty_params)).to be_a(Hash)
      end
    end
  end
end
