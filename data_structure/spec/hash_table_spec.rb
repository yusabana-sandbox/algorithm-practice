RSpec.describe HashTable do
  describe '#set' do
    it {
      hash = HashTable.new
      hash.set('foo', 'bar')
      hash.set('hoge', 'fuga')
      hash.set('num', 10)

      expect(hash.get('foo')).to eq 'bar'
      expect(hash.get('hoge')).to eq 'fuga'
      expect(hash.get('num')).to eq 10
      expect(hash.get('')).to eq nil
      expect(hash.get(nil)).to eq nil
    }

    it "ordered hash test" do
      hash = HashTable.new

      data = [
        ['foo', 'bar'],
        ['hoge', 'fuga'],
        ['num', 10],
      ]

      data.each do |key, value|
        hash.set(key, value)
      end

      i = 0
      hash.each do |key, value|
        expect(key).to eq data.reverse[i][0]
        expect(value).to eq data.reverse[i][1]

        i += 1
      end
    end
  end
end
