# quicksort.rb
# From: http://opennfo.wordpress.com/2009/02/15/quicksort-in-ruby/

def quicksort(list, left_index, right_index)
  # We need to clone the list so that we capture it
  # at the current moment.  Otherwise by the time
  # the message is evaluated the list is sorted.
  Rails.logger.visual({:list => list.clone}, :event => "visual")

  if left_index < right_index then
    q = partition(list, left_index, right_index)
    quicksort(list, left_index, q-1)
    quicksort(list, q+1, right_index)
  end
end

def partition(list, left_index, right_index)
  pivot = list[right_index]
  i = left_index - 1
  left_index.upto(right_index-1) do |j|
    Rails.logger.visual({:pivot_index => right_index, :left_index => i+1, :right_index => j}, :event => "compare")
    if list[j] <= pivot
      i = i+1
      list[i], list[j] = list[j],list[i]
      Rails.logger.visual({:list => list.clone}, :event => "visual")
    end
  end
  list[i+1],list[right_index] = list[right_index],list[i+1]
  Rails.logger.visual({:pivot_index => right_index, :left_index => i+1, :right_index => right_index}, :event => "compare")
  return i + 1
end

