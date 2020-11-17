require 'benchmark'
require 'benchmark/memory'

def counting_sort_select(array)
  result = []
   for element in (0..99)
    filtered_array = array.select{|number| number == element} #[1,1]
    result.push(filtered_array.length) # result[0] = 2
   end
   return result 
end


def counting_sort_hash(array)
  myhash = Hash.new(0)
  result = []
  
  for index in (0...array.length)
    next if !array[index]
    value = array[index]
    if myhash[value]
      myhash[value] = myhash[value] + 1 
    else
      myhash[index] = 1
    end
  end
  for i in (0..99)
    if myhash[i]
      result << myhash[i]
    else
      result << 0
    end
  end
  return result
end


def counting_sort_array_count(array)

  count_array = Array.new(100,0)

  (array & (0..99).to_a).each do |number|
    count_array[number] = array.count(number)
  end
  return count_array

end

def counting_sort_array_no_count(array)

  count_array = Array.new(100,0)

  array.each do |number|
    count_array[number] += 1
  end
  return count_array

end



def benchmark(array)
  Benchmark.bmbm do |x|
    x.report("counting_sort_select") {counting_sort_select(array)}
    x.report("counting_sort_hash") {counting_sort_hash(array)}
    x.report("counting_sort_array_count") {counting_sort_array_count(array)}
    x.report("counting_sort_array_no_count") {counting_sort_array_no_count(array)}
  end

  Benchmark.memory do |x|
    x.report("counting_sort_select") {counting_sort_select(array)}
    x.report("counting_sort_hash") {counting_sort_hash(array)}
    x.report("counting_sort_array_count") {counting_sort_array_count(array)}
    x.report("counting_sort_array_no_count") {counting_sort_array_no_count(array)}
  end
end


test_array = [63, 25, 73, 1, 98, 73, 56, 84, 86, 57, 16, 83, 8, 25, 81, 56, 9, 53, 98, 67, 99, 12, 83, 89, 80, 91, 39, 86, 76, 85, 74, 39, 25, 90, 59, 10, 94, 32, 44, 3, 89, 30, 27, 79, 46, 96, 27, 32, 18, 21, 92, 69, 81, 40, 40, 34, 68, 78, 24, 87, 42, 69, 23, 41, 78, 22, 6, 90, 99, 89, 50, 30, 20, 1, 43, 3, 70, 95, 33, 46, 44, 9, 69, 48, 33, 60, 65, 16, 82, 67, 61, 32, 21, 79, 75, 75, 13, 87, 70, 33]
benchmark(test_array)