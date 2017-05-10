class BinaryTree
  def initialize
    @root = nil
  end

  def add(value)
    if @root.nil?
      @root = Node.new(value)
    else
      @root.add(value)
    end
  end
end
