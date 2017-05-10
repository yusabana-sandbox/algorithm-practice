class BinaryTreeMap
  # Stringのキーにするならキーはその方に限定する必要がある
  class Node
    def initialize(key, value)
      @key = key     # 2分探索木のkeyを格納
      @value = value
      @left_node = nil
      @right_node = nil
    end

    def set(key, value)
      if key == @key
        @value = value
      elsif key < @key
        set_to_left(key, value)
      elsif key > @key
        set_to_right(key, value)
      end
    end

    def get(key)
      if key == @key
        @value
      elsif key < @key
        get_from_left(key)
      elsif key > @key
        get_from_right(key)
      end
    end

    private

    def set_to_left(key, value)
      if @left_node.nil?
        @left_node = Node.new(key, value)
      else
        @left_node.set(key, value)
      end
    end

    def set_to_right(key, value)
      if @right_node.nil?
        @right_node = Node.new(key, value)
      else
        @right_node.set(key, value)
      end
    end

    def get_from_left(key)
      if @left_node.nil?
        nil
      else
        @left_node.get(key)
      end
    end

    def get_from_right(key)
      if @right_node.nil?
        nil
      else
        @right_node.get(key)
      end
    end
  end
end
