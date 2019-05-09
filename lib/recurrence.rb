require "recurrence/version"
require 'recurrence/event'

module Recurrence
  LOGGER = STDOUT

  def self.for(event_options = {})
    e = Event.new(event_options)
    errors = e.validate
    errors.empty? ? e : log_error(errors)
  end

  def self.log_error(message)
    LOGGER.puts message
  end
end
