# Strap on a visual level of logging that streams information
# back to the original response.

class ActiveSupport::Logger
  def vis_queue
    @@vis_queue ||= Queue.new
  end

  def visual msg, options = {}
    debug msg
    options[:event] = 'visual' unless options[:event]
    vis_queue << [msg, options]
  end
end
