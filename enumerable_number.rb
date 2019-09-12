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

  def my_all?
    result = true
    if block_given?
      my_each do |element|
        result = false unless yield(element)
      end
    else
      my_each do |element|
        result = false unless element
      end
    end
    result
  end

  def my_any?
    result = false
    if block_given?
      my_each do |element|
        result = true if yield(element)
      end
    else
      my_each do |element|
        result = true if element
      end
    end
    result
  end
end
