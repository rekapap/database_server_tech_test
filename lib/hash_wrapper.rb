# Hash Wrapper
class HashWrapper
  def initialize
    @data = {}
  end

  def data
    @data.dup
  end

  def set(hash)
    hash.each do |key, value|
      @data[key] = value
    end
  end

  def get(key)
    @data[key]
  end
end
