require 'pry'
require 'pry-doc'
require 'awesome_print'

class InsertSort
  def sort(list)
    tmp_list = list.dup
    sorted = []
    while target = tmp_list.shift
      sorted << target and next if sorted.empty?
      if idx = sorted.find_index{|o| target.age < o.age }
        sorted.insert(idx, target)
      else
        sorted << target
      end
    end
    sorted
  end

  # each_with_objectを使う場合
  def sort2(list)
    list.each_with_object([]) do |row, memo|
      if idx = memo.find_index { |memo_row| row.age <  memo_row.age }
        memo.insert(idx, row)
      else
        memo << row
      end
    end
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

  ap InsertSort.new.sort(users).map(&:age)
  ap InsertSort.new.sort2(users).map(&:age)
end
