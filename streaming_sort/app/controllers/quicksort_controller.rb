require 'quicksort'
require 'visualizer_logger'

class QuicksortController < ApplicationController
  def index
    a = scrambled_array params[:array]
    quicksort(a, 0, a.length-1)
  end
  
  private
  def scrambled_array user_array
    if user_array
      user_array.split(',').map { |i| i.to_i }
    else
      a = []
      30.times { a << rand(100) }
      a
    end
  end

end
