require 'minitest/autorun'
require 'minitest/spec'
require "minitest-spec-context"
require_relative '../event'

describe "Testa o modelo Event" do
	
	context "Testa conversão" do
		it "Tem retorna um json esperado" do
			json_expected = '{"type":"ERROR","message":"Erro no sistema do modulo"}'
			assert_equal json_expected, Event.new(:ERROR, "Erro no sistema do modulo").to_json 
		end
		it "Tem retorna um modelo de acordo com o json" do
			json = '{"type":"ERROR","message":"Erro no sistema do modulo"}'
			event = Event.get(json)
			assert_equal :ERROR, event.type
			assert_equal "Erro no sistema do modulo", event.message
		end
	end
end