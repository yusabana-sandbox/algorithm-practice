require 'pry'
require 'pry-doc'
require 'awesome_print'

# https://leetcode.com/problems/reverse-string/
class ReverseString
  def self.run1(str)
    str.reverse
  end

  def self.run2(str)
    str.chars.inject([]) { |result, char| result.unshift(char) }.join
  end
end


if __FILE__ == $0

  ap ReverseString.run1('hoge fuga')
  ap ReverseString.run2('hoge fuga')

end
