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
      user_array.split ','
    else
      [23, 16, 8, 4, 42, 15]
    end
  end

end
