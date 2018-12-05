# ParamsValidator
class ParamsValidator
  def self.validate(params)
    return if params.empty?

    params.compact!
    return if params.empty?

    delete_empty_string_pairs(params)
    return if params.empty?

    params
  end

  def self.validate_key(params)
    return if params['key'] == ''

    params['key']
  end

  class << self
    private

    def delete_empty_string_pairs(params)
      params.each do |key, value|
        params.delete(key) if key == ''
        params.delete(key) if value == ''
      end
    end
  end
end
