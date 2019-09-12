# frozen_string_literal:true

module Enumerable
  def my_each
    i = 0
    while i < length
      yield(self[i])
      i += 1
    end
  end

  def my_each_with_index
    i = 0
    while i < length
      yield(self[i], i)
      i += 1
    end
  end

  def my_select
    result = []
    my_each do |element|
      result << element if yield(element)
    end
    result
  end

  
end
