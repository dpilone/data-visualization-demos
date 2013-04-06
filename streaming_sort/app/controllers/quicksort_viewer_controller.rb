require 'reloader/sse'
require 'visualizer_logger'
require 'quicksort'

class QuicksortViewerController < ApplicationController
  include ActionController::Live

  def index
    # SSE expects the 'text/event-stream' content type
    response.headers['Content-Type'] == 'text/event-stream'

    Rails.logger.visualize response do
      a = [9,4,10,12,5,3,2,25,6,21,33,23,19,13,38,26]
      quicksort(a, 0, a.length-1)
      #puts a.inspect
    end
  end
end
