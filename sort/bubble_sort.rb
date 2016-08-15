require 'pry'
require 'pry-doc'
require 'awesome_print'

class BubbleSort
  def sort(list)
    max_idx = list.size - 1

    (0...max_idx).each do |x|     # 最後の値は含まない range
      (x+1..max_idx).each do |y| # 最後の値も含む range
        if list[x].age < list[y].age
          tmp = list[x]
          list[x] = list[y]
          list[y] = tmp
        end
        ## 上記の if文は以下のように一行で書くことも可能
        # list[x], list[y] = list[y], list[x] if list[x].age < list[y].age
      end
    end

    ## 上記のeach文はfor文にも書き換えられる
    # for x in (0...max_idx)
    #   for y in (x+1..max_idx)
    #     ap "#{x} #{y}"
    #     list[x], list[y] = list[y], list[x] if list[x].age < list[y].age
    #   end
    # end

    list
  end
end



if __FILE__ == $0
  User = Struct.new("User", :age)
  users = [
    User.new(3),
    User.new(2),
    User.new(30),
    User.new(10),
    User.new(100),
    User.new(122),
    User.new(22),
  ]

  ap BubbleSort.new.sort(users).map(&:age)

end
