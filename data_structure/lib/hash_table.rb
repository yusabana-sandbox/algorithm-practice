class HashTable
  BIN_SIZE = 4

  def initialize
    @bins = Array.new(BIN_SIZE) do |i|
      List.new
    end

    # keyに順序を持たせるための連結リスト
    @keys = List.new
  end

  def bin(key)
    index = key.hash % BIN_SIZE
    @bins[index]
  end

  def set(key, value)
    target_bin = bin(key)
    target_bin.each do |pair|
      if pair[0] == key
        pair[1] = value
        return self
      end
    end

    target_bin.unshift([key, value])
    @keys.unshift(key) # 後から追加したものが先頭になる順序
    self
  end

  def get(key)
    bin(key).each do |pair|
      return pair[1] if pair[0] == key
    end

    nil
  end

  def each
    @keys.each do |key|
      value = get(key)
      yield key, value
    end
  end

end
