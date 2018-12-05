class HashWrapper
  def initialize
    @data = {}
  end

  def set(key:, value:)
    @data[key] = value
  end

  def get(key:)
    @data[key]
  end

  def data
    @data.dup
  end
end
