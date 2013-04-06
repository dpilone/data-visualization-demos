require 'quicksort'
require 'visualizer_logger'

class QuicksortController < ApplicationController
  def index
    a = [9,4,10,12,5,3,2,25,6,21,33,23,19,13,38,26]
    quicksort(a, 0, a.length-1)
    #puts a.inspect
  end
end
