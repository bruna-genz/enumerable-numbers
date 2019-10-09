# frozen_string_literal:true

module Enumerable
  def my_each
    i = 0
    result = []

    return to_enum(:my_each) unless block_given?

    while i < length
      result << yield(self[i])
      i += 1
    end
    result
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
    return to_enum(:my_each) unless block_given?

    my_each do |element|
      result << element if yield(element)
    end
    result
  end

  def my_all?
    result = true
    if block_given?
      my_each { |element| result = false unless yield(element) }
    else
      my_each { |element| result = false unless element }
    end
    result
  end

  def my_any?(arg = nil)
    result = false
    if arg
      my_each { |element| result = true if element.is_a?(arg) }
    elsif block_given?
      my_each { |element| result = true if yield(element) }
    else
      my_each { |element| result = true if element }
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

  def my_count(arg = nil)
    result = 0
    if block_given?
      my_each do |element|
        result += 1 if yield(element)
      end
    elsif arg
      my_each do |element|
        result += 1 if element == arg
      end
    else
      result = length
    end
    result
  end

  def my_map(proc = nil)
    result = []
    if proc
      my_each { |element| result << proc.call(element) }
    else
      my_each { |element| result << yield(element) }
    end
    result
  end

  def my_inject(arg1 = nil, arg2 = nil)
    if block_given? && arg1
      result = arg1
      my_each { |element| result = yield(result, element) }
    elsif block_given? && !arg1
      result = self[0]
      my_each_with_index do |element, index|
        result = yield(result, element) unless index.zero?
      end
    else
      result = arg1
      operation = arg2.to_proc
      my_each { |element| result = operation.call(result, element) }
    end
    result
  end
end

def multiply_els(array)
  array.my_inject(1, :*)
end
