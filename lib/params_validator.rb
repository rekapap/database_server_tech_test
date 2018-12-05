# ParamsValidator
class ParamsValidator
  def self.validate(params)
    return if params.empty?
    return if params.compact!.empty?

    params
  end
end
