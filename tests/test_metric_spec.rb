require 'minitest/autorun'
require 'minitest/spec'
require "minitest-spec-context"
require_relative '../metric'

describe "Testa o modelo Metric" do
  context "Testa argumentos" do
    it "Deve lançar exceção se não houver parametros" do
      assert_raises ArgumentError do
        Metric.new
      end
    end
    it "Deve lançar exceção se não o parametro lng" do
      assert_raises ArgumentError do
        Metric.new(100, nil)
      end
    end
    it "Deve lançar exceção se não o parametro lat" do
      assert_raises ArgumentError do
        Metric.new(nil, 100)
      end
    end
  end

  context "Testa conversão do model" do
    it "Deve retornar um json esperado" do
      json_expected = '{"lat":100,"lng":100}'
      assert_equal json_expected, Metric.new(lat: 100, lng:100).to_json 
    end
    it "Deve retornar um modelo de acordo com o json" do
      json = '{"lat":100,"lng":100}'
      metric = Metric.get(json)
      assert_equal 100, metric.lat
      assert_equal 100, metric.lng
    end
  end
end