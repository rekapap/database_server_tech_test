# ParamsValidator
class ParamsValidator
  def self.validate(params)
    return if params.empty?

    params.compact!
    return if params.empty?

    params
  end
end