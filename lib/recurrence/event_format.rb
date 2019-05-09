# frozen_string_literal: true

require 'date'

module Recurrence
  module EventFormat
    ALLOWED_FORMAT_KEYS = [:name, :every, :month, :year, :date, :day, :ordinal]
    REQUIRED_FORMAT_KEYS = [:name, :every] # assuming :name is required

    def self.validate(options = {})
      options = options.inject({}) { |h, (k, v)| h.merge(k.to_sym => v) }
      options.select! { |k, v| ALLOWED_FORMAT_KEYS.include?(k) }

      invalid = REQUIRED_FORMAT_KEYS.any? { |key| options[key].nil? }
      return "Missing required options - #{REQUIRED_FORMAT_KEYS - options.keys}" if invalid

      errors = ALLOWED_FORMAT_KEYS.map do |key|
        validator_method = "validate_#{key}".to_sym
        if options.key?(key) && respond_to?(validator_method)
          method(validator_method.to_sym).call(options[key])
        end
      end.compact
      return errors.join("\n") if errors.any?

      if ['month', 'year'].include? options[:every].to_s
        error = validate_format_combination(options)
        return error if error
      end
    end

    def self.validate_name(name)
      name = name.to_s.strip
      valid = name.length.between?(3, 50) # Better to define constants
      return ':name should be minimum of 3 and maximum of 50 chars' unless valid
    end

    def self.validate_every(every)
      valid_values = ['day', 'month', 'year'] # constantize me 
      valid = valid_values.include?(every.to_s)
      return ":every should be one of #{valid_values}" unless valid
    end

    def self.validate_month(month)
      valid = Date::MONTHNAMES.compact.include?(month.to_s.capitalize)
      return ":month should be one of #{Date::MONTHNAMES}" unless valid
    end

    def self.validate_day(day)
      valid = Date::DAYNAMES.include?(day.to_s.capitalize)
      return ":day should be one of #{Date::DAYNAMES}" unless valid
    end

    def self.validate_format_combination(options)
      every = options[:every].to_s
      case every
      when 'month'
        validate_month_combination(options)
      when 'year'
        validate_year_combination(options)
      else
        raise 'unexpected :every option'
      end
    end
  end
end
