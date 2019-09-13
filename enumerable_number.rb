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

  def my_none?
    result = true
    if block_given?
      my_each do |element|
        result = false if yield(element)
      end
    else
      my_each do |element|
        result = false if element
      end
    end
    result
  end

  def my_count
    result = length
    unless block_given?
      my_each do |element|
        result += 1 if yield(element)
      end
    end
    result
  end

  def my_map
    result = []
    my_each do |element|
      result << yield(element)
    end
    result
  end

  def my_inject(arg1 = nil, arg2 = nil)
    result = self[0]
    if block_given?
      my_each do |element|
        result = yield(result, element)
      end
    else
      result = arg1
      operation = arg2.to_proc
      my_each do |element|
        result = operation.call(result, element)
      end
    end
    result
  end
end

def multiply_els(array)
  array.my_inject(1, :*)
end
