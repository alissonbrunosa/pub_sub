require 'redis'
require_relative 'executor'


redis = Redis.new(host: "localhost")

redis.subscribe("process_event", "process_metric") do |on|
  on.message do |channel, message|
    Thread.new do 
      executor = Executor.new	
      executor.send(channel, message)
    end
  end
end


