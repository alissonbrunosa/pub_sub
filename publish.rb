require 'redis'
require 'json'
require_relative 'metric'
require_relative 'event'


redis = Redis.new(host: 'localhost')

loop do
	sleep(0.01)
	puts "Nova metrica registrada #{Time.now.strftime('%d/%m/%Y %H:%M:%S.%L')}"
	redis.publish('process_metric', Metric.new(lat:100, lng:100).to_json)

	sleep(0.01)

	puts "Nova evento registrado #{Time.now.strftime('%d/%m/%Y %H:%M:%S.%L')}"
	redis.publish('process_event', Event.new(:ERROR, "Erro no sistema do modulo").to_json)
end