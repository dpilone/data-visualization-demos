# quicksort.rb
# From: http://opennfo.wordpress.com/2009/02/15/quicksort-in-ruby/

def quicksort(list, left_index, right_index)
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
        if list[j] <= pivot
            i = i+1
            list[i], list[j] = list[j],list[i]
        end
    end
    list[i+1],list[right_index] = list[right_index],list[i+1]
    return i + 1
end

# Testing it out
a = [9,4,10,12,5,3,2,25,6,21,33,23,19,13,38,26]
puts a.inspect
quicksort(a, 0, a.length-1)
puts a.inspect
