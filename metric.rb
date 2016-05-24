require 'json'

class Metric
  attr_accessor :lat, :lng

  def initialize(lat:nil, lng:nil)
    @lat = lat || raise(ArgumentError, "Argument 'lat' not be nil")
    @lng = lng || raise(ArgumentError, "Argument 'lng' not be nil")
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
      Metric.new(lat:hash['lat'], lng:hash['lng'])
    end
  end
end