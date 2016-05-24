require_relative 'metric'
require_relative 'event'
require 'json'

class Executor
  def process_metric(metric)
    m = Metric.get(metric)
    puts "Processou Metrica :---> #{m.lat}, #{m.lng}"
  end

  def process_event(event)
    e = Event.get(event)
    puts "Processou Evento:---> #{e.type}, #{e.message}"
  end
end