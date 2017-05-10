RSpec.describe List do

  describe "#each" do
    it "#unshift" do
      list = List.new
      list.unshift(4)
      list.unshift(3)
      list.unshift(2)
      list.unshift(1)

      list.each { |value|
        p value
      }
    end

    it "#push" do
      list = List.new
      list.push(4)
      list.push(3)
      list.push(2)
      list.push(1)

      list.each { |value|
        p value
      }
    end

    it "#[]" do
      list = List.new
      list.push(4)
      list.push(3)
      list.push(2)
      list.push(1)

      expect(list[0]).to eq 4
      expect(list[1]).to eq 3
      expect(list[2]).to eq 2
      expect(list[3]).to eq 1
      expect(list[4]).to eq nil
      expect(list[-1]).to eq nil
    end
  end

end
