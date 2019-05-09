require 'recurrence/event_format'

module Recurrence
  class Event
    attr_reader :options

    def initialize(options = {})
      @options = options.to_h
    end

    def validate
      errors = EventFormat.validate(options)
      @valid = errors.empty?
      errors
    end

    def start_date
    end

    def end_date
    end

    def occurrences(no = nil)
    end

    private

    def valid?
      @valid
    end
  end
end
