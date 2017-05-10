RSpec.describe BinaryTree do

  describe "#add" do

    it {
      binary_tree = BinaryTree.new
      binary_tree.add(3)
      binary_tree.add(5)
      binary_tree.add(1)
      binary_tree.add(2)
      binary_tree.add(10)
      binary_tree.add(1)

      ap binary_tree
    }

  end

end
