require 'pry'
require 'pry-doc'
require 'awesome_print'

class BubbleSort
  def sort(list)
    max_idx = list.size - 1

    (0...max_idx).each do |n|
      (0..max_idx-n).each do |x|
        next if list[x+1].nil?

        if list[x].age > list[x+1].age
          tmp = list[x]
          list[x] = list[x+1]
          list[x+1] = tmp
        end
        # # 上記の if文は以下のように一行で書くことも可能
        # list[x], list[x+1] = list[x+1], list[x] if list[x].age > list[x+1].age
      end
    end

    # ## 以下のようにfor文で書き換えられる
    # for n in 0...max_idx
    #   for x in 0..max_idx-n
    #     next if list[x+1].nil?
    #
    #     if list[x].age > list[x+1].age
    #       tmp = list[x]
    #       list[x] = list[x+1]
    #       list[x+1] = tmp
    #     end
    #     # # 上記の if文は以下のように一行で書くことも可能
    #     # list[x], list[x+1] = list[x+1], list[x] if list[x].age > list[x+1].age
    #   end
    # end

    ###########################
    #### バブルソートの勘違い。以下の実装のように先頭を固定しているのはバブルソートとしては間違い
    ###########################
    # (0...max_idx).each do |x|    # 最後の値は含まない range
    #   (x+1..max_idx).each do |y| # 最後の値も含む range
    #     if list[x].age < list[y].age
    #       tmp = list[x]
    #       list[x] = list[y]
    #       list[y] = tmp
    #     end
    #     ## 上記の if文は以下のように一行で書くことも可能
    #     # list[x], list[y] = list[y], list[x] if list[x].age < list[y].age
    #   end
    # end
    ## 上記のeach文はfor文にも書き換えられる
    # for x in (0...max_idx)
    #   for y in (x+1..max_idx)
    #     ap "#{x} #{y}"
    #     list[x], list[y] = list[y], list[x] if list[x].age < list[y].age
    #   end
    # end

    list
  end

  # Rubyでソート・アルゴリズムを表現しよう! #バブルソート
  # http://melborne.github.io/2010/10/12/Ruby/#section-2
  def reference_sort(list)
    tmp = list.dup
    res = []

    bubbling = Proc.new do |_tmp|
      (_tmp.length-1).times do |i|
        _tmp[i], _tmp[i+1] = _tmp[i+1], _tmp[i] if _tmp[i].age > _tmp[i+1].age
      end
      _tmp.delete_at(-1)
    end

    res.unshift bubbling.call(tmp) until tmp.empty?
    res
  end
end



if __FILE__ == $0
  User = Struct.new("User", :age)
  users = [
    User.new(100),
    User.new(3),
    User.new(2),
    User.new(30),
    User.new(10),
    User.new(122),
    User.new(22),
  ]

  ap BubbleSort.new.sort(users).map(&:age)
  ap BubbleSort.new.reference_sort(users).map(&:age)

end
