# Strap on a visual level of logging that streams information
# back to the original response.
#
# To use, simply do:
# Rails.logger.visualize response do
#   ... invoke code that streams responses back ...
# end

class ActiveSupport::Logger
  def visualize response
    Thread.current[:sse] = Reloader::SSE.new(response.stream)
    begin
      yield
    rescue IOError
      # We will get this if we try to write and the stream has
      # been closed by the client.  NBD.
    ensure
      puts "Closing the SSE"
      sse.close
    end
    Thread.current[:sse] = nil
  end

  def sse
    Thread.current[:sse]
  end

  def visual msg, options = {}
    debug msg
    options[:event] = 'visual' unless options[:event]
    sse.write msg, options if sse
  end
end
