module Enumerable
  # Your code goes here
  def my_each_with_index
    # for i in 0...self.length
    #   yield(self[i], i)
    # end
    # self
    each_with_index do |elem, index|
      yield(elem, index)
    end
    return self
  end

  def my_select
    result = []
    for item in self
      result << item if yield(item)
    end
    return result
  end

  def my_all?
    for item in self
      return false if !yield(item)
    end
    return true
  end

  def my_any?
    for item in self
      return true if yield(item)
    end
    return false
  end

  def my_none?
    for item in self
      return false if yield(item)
    end
    return true
  end

  def my_count
    count = 0
    if block_given?
      self.each do |item|
        count+=1 if yield(item)
      end
      return count
    else
    return self.length
    end
  end

  def my_map
    result = []
    if block_given?
      self.each do |item|
        result << yield(item)
      end
      return result
    else
      return self
    end
  end

  def my_inject(initial_value)
    if !self.empty?    
      accum = initial_value
      self.each do |value|
        accum = yield(accum,value)
      end
      return accum
    else
      return initial_value
    end
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    for item in self
      yield(item)
    end
  end
end
