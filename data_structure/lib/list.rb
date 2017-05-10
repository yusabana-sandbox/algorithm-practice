class List
  def initialize
    @first_element = nil
  end

  def unshift(value)
    element = Element.new(value, @first_element)
    @first_element = element
  end

  def push(value)
    if @first_element.nil?
      @first_element = Element.new(value, nil)
    else
      current_element = @first_element
      while current_element.next_ref
        current_element = current_element.next_ref
      end
      current_element.next_ref = Element.new(value, nil)
    end
  end

  def [](index)
    return nil if index < 0

    current_index = 0
    current_element = @first_element

    loop do
      return nil if current_element.nil?

      if current_index == index
        return current_element.value
      end

      current_index += 1
      current_element = current_element.next_ref
    end
  end

  def each
    current_element = @first_element

    while current_element
      yield current_element.value
      current_element = current_element.next_ref
    end
  end
end
