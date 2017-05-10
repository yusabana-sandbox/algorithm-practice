# 2分探索木はハッシュテーブルよりメモリ効率はいい
class BinaryTreeMap
  def initialize
    @root = nil
  end

  def set(key, value)
    if @root.nil?
      @root = BinaryTreeMap::Node.new(key, value)
    else
      @root.set(key, value)
    end
    self
  end

  def get(key)
    if @root.nil?
      nil
    else
      @root.get(key)
    end
  end
end
