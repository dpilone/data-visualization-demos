require 'reloader/sse'

class QuicksortViewerController < ApplicationController
  include ActionController::Live

  def index
    # SSE expects the 'text/event-stream' content type
    response.headers['Content-Type'] == 'text/event-stream'

    sse = Reloader::SSE.new(response.stream)
    begin
      loop do
        sse.write({ :time => Time.now })
        sleep 1
      end
    rescue IOError
      # When a client disconnects we'll get an IOError on write, NBD.
    ensure
      sse.close
    end
  end
end