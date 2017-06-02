# Flickrの短縮URL用にRubyでbase58実装 | EasyRamble
#   http://easyramble.com/ruby-flickr-base58.html
# ActiveSupportでの実装
#   http://api.rubyonrails.org/classes/SecureRandom.html
# dougal/base58での実装
#   https://github.com/dougal/base58/blob/master/lib/base58.rb
# alnumから 0, l, I, O を除外した58文字

require 'securerandom'
BASE58_ALPHABET = ('0'..'9').to_a + ('a'..'z').to_a + ('A'..'Z').to_a - %w(0 l I O)

def base58_encode(photo_id)
  id = photo_id.to_i
  base = BASE58_ALPHABET.size

  encoded_str = ""
  while id > 0
    mod = id % base
    encoded_str = BASE58_ALPHABET[mod] + encoded_str
    id = id / base
  end

  encoded_str
end

# (1の位(58^0), 58の位(58^1), 58の2乗の位(58^2)....)というような感じでdecodeをする
def base58_decode(encoded_str)
  base = BASE58_ALPHABET.size

  decoded = 0
  multi = 1
  while encoded_str.size > 0
    c = encoded_str.slice!(-1)
    decoded = decoded + BASE58_ALPHABET.index(c) * multi
    multi = multi * base
  end

  decoded
end

def base58(id)
  id = id.to_i
  alphabet = BASE58_ALPHABET
  base = alphabet.length
  begin
    id, m = id.divmod(base)
    r = alphabet[m] + (r || '')
  end while id > 0
  r
end

p base58_encode(200)
p base58(10)
p base58(11)
p base58_decode('4s')




def activesupport_randombase58(n = 16) # n は出力するlength
  SecureRandom.random_bytes(n).unpack("C*").map do |byte|
    idx = byte % 64
    idx = SecureRandom.random_number(58) if idx >= 58
    BASE58_ALPHABET[idx]
  end.join
end

p activesupport_randombase58(10)
