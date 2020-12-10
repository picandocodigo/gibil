# frozen_string_literal: true

require 'minitest/spec'
require 'minitest/pride'
require 'minitest/autorun'
require 'gibil'

describe Gibil do
  it 'should return a temperature' do
    assert Float(Gibil::Sensor.temperature)
  end
end
