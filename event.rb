require 'json'

class Event
	attr_accessor :type, :message

	def initialize(type, message)
		@type = type
		@message = message
	end

	def to_json
		hash = {}
		model = instance_variables.each do |variable|
			hash[variable.to_s.delete("@").to_sym] = instance_variable_get(variable)
		end
		hash.to_json
	end
	
	class << self
		def get(json)
			hash = JSON.parse(json)
			Event.new(hash['type'].to_sym, hash['message'])
		end
	end
end