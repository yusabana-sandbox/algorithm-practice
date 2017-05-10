RSpec.describe BinaryTreeMap do

  describe "#set and #get" do
    it {
      map = BinaryTreeMap.new
      map.set("foo", "bar")
      map.set("hoge", "fuga")

      expect(map.get("foo")).to eq "bar"
      expect(map.get("hoge")).to eq "fuga"
      expect(map.get("NOT_KEY")).to eq nil
    }
  end

end
