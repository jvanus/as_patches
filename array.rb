# This file contains a few simple methods I've found useful.

class NotAnArrayOfOne < StandardError; end

Array
class Array

  # Returns a count of each unique object in an Array
  def count_uniq
   Hash[self.uniq.collect{ |v| [v, self.select{ |n| n == v }.count] }]
  end

  # Returns elements of an array matching the input
  def match(string)
   self.select{|m| m.to_s.match(string)}
  end

  # Returns the only element of an array or raises an exception
  # Similar to .first but does not assume an array of 1
  def sole
     case self.count
     when 0
       raise NotAnArrayOfOne, "array is empty"
     when 1
       self.first
     else
       raise NotAnArrayOfOne, "array has more than 1 object"
     end
  end

  # I totally 100% copied this from Chad [https://github.com/cmolenda]
  def select_duplicates
    dolly = self.clone
    select do |e|
      dollsize = dolly.size
      dolly.delete e
      dolly.size < dollsize - 1
    end
  end
end
