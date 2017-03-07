require 'pry'
require 'pry-doc'
require 'awesome_print'

class MergeSort
  def sort(list)
  end
end



if __FILE__ == $0
  def users
    user = Struct.new("User", :age)
    [
      user.new(100),
      user.new(3),
      user.new(30),
      user.new(10),
      user.new(122),
      user.new(2),
      user.new(22),
    ]
  end

  ap MergeSort.new.sort(users).map(&:age)
end
