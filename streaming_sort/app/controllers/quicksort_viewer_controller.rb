require 'reloader/sse'
require 'visualizer_logger'
require 'quicksort'

class QuicksortViewerController < ApplicationController
  include ActionController::Live

  def index
    # SSE expects the 'text/event-stream' content type
    response.headers['Content-Type'] = 'text/event-stream'
    sse = Reloader::SSE.new(response.stream)

    begin
      loop do
        message = Rails.logger.vis_queue.pop
        sse.write message[0], message[1]
      end
    rescue Exception => e
      # We'll get this if we try to write and the stream has been closed
      # by the client.  NBD.
    ensure
      sse.close
    end
  end
end
