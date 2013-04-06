# quicksort.rb
# From: http://opennfo.wordpress.com/2009/02/15/quicksort-in-ruby/

def quicksort(f, list, left_index, right_index)
    if left_index < right_index then
        q = partition(list, left_index, right_index)
        f.puts "<tr><td>#{list}</td><td>#{left_index}</td><td>#{right_index}</td></tr>"
        quicksort(f, list, left_index, q-1)
        quicksort(f, list, q+1, right_index)
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
f = File.new('quicksort.html', 'w')
f.puts "<!DOCTYPE html>"
f.puts "<html>"
f.puts "<head>"
f.puts "<link href='bootstrap/css/bootstrap.min.css' rel='stylesheet' media='screen'>"
f.puts "</head>"
f.puts "<body>"
f.puts "<table class='table table-hover table-bordered'>"
f.puts "<thead><tr><th>List</th><th>p</th><th>r</th></tr></thead>"
f.puts "<tbody>"
#a = [9,4,10,12,3,5,10,3,2,25,6,21,33,23,19,13,38,26,12,3]
a = [5,4,3,2,1]
quicksort(f, a, 0, a.length-1)
f.puts "</tbody>"
f.puts "</body>"
f.puts "</table>"
puts a
