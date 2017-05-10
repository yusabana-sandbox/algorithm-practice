class Element
  attr_accessor :value, :next_ref

  def initialize(value, next_ref)
    @value = value
    @next_ref = next_ref
  end
end
