require 'pry'
require 'pry-doc'
require 'awesome_print'

# 選択ソート
# http://www.codereading.com/algo_and_ds/algo/selection_sort.html
class SelectionSort
  def sort(list)
    max_idx = list.size - 1

    # (0...max_idx).each do |x|         # 最後の値は含まない range
    #   (x+1..max_idx).each do |y|      # 最後の値も含む range
    #     # if list[x].age > list[y].age
    #     #   tmp = list[x]
    #     #   list[x] = list[y]
    #     #   list[y] = tmp
    #     # end
    #     ## 上記の if文は以下のように一行で書くことも可能
    #     list[x], list[y] = list[y], list[x] if list[x].age > list[y].age
    #   end
    # end
    #
    ## for文で書いたパターン
    for x in 0...max_idx
      for y in x+1..max_idx
        list[x], list[y] = list[y], list[x] if list[x].age > list[y].age
      end
    end
    list
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

  ap SelectionSort.new.sort(users).map(&:age)
end
