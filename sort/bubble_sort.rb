require 'pry'
require 'pry-doc'
require 'awesome_print'

class BubbleSort
  def sort(list)
    tmp_list = list.dup
    max_idx = tmp_list.size - 1

    (0...max_idx).each do |n|
      (0..max_idx-n).each do |x|
        next if tmp_list[x+1].nil?

        if tmp_list[x].age > tmp_list[x+1].age
          tmp = tmp_list[x]
          tmp_list[x] = tmp_list[x+1]
          tmp_list[x+1] = tmp
        end
        # # 上記の if文は以下のように一行で書くことも可能
        # tmp_list[x], tmp_list[x+1] = tmp_list[x+1], tmp_list[x] if tmp_list[x].age > tmp_list[x+1].age
      end
    end
    # ## 以下のようにfor文で書き換えられる
    # for n in 0...max_idx
    #   for x in 0..max_idx-n
    #     next if tmp_list[x+1].nil?
    #     tmp_list[x], tmp_list[x+1] = tmp_list[x+1], tmp_list[x] if tmp_list[x].age > tmp_list[x+1].age
    #   end
    # end

    tmp_list
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

  def bsort(a)
    dup = a.dup
    l = dup.size

    # index が 1 始まり -1 したものと比較する
    for i in 1..l do
      for j in 1..(l-i) do
        if dup[j - 1].age > dup[j].age
          t = dup[j]
          dup[j] = dup[j - 1]
          dup[j - 1] = t
        end
      end
    end

    # index が 0始まり +1 したものと比較する
    # for i in 0..l do
    #   for j in 0..(l-i) do
    #     p dup.map(&:age)
    #     ap dup[j]
    #     next unless dup[j + 1]
    #     if dup[j].age > dup[j + 1].age 
    #       t = dup[j]
    #       dup[j] = dup[j + 1]
    #       dup[j + 1] = t
    #     end
    #   end
    # end

    return dup
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

  ap BubbleSort.new.sort(users).map(&:age)
  ap BubbleSort.new.reference_sort(users).map(&:age)
  ap BubbleSort.new.bsort(users).map(&:age)
end
