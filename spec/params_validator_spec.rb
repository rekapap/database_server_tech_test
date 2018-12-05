require 'params_validator'

describe ParamsValidator do
  describe '.validate' do
    context 'invalid params' do
      it 'returns nil if parameters are nil' do
        empty_params = {}
        expect(described_class.validate(empty_params)).to eq(nil)
      end
    end
  end
end
