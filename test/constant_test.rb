# frozen_string_literal: true

require_relative "test_helper"

class ConstantTest < Test::Unit::TestCase
  test "CONSTANTS" do
    assert do
      ::Berean::CONSTANTS
    end
  end

  test "Constants is a Hash" do
    assert_instance_of Hash, ::Berean::CONSTANTS
  end

  test "Constants keys are all String" do
    assert do
      ::Berean::CONSTANTS.keys.all? do |key|
        key.instance_of? String
      end
    end
  end

  test "Constants values are all Array of length 2" do
    assert do
      ::Berean::CONSTANTS.values.all? do |value|
        value.instance_of?(Array) &&
        value.length.eql?(2)
      end
    end
  end

  test "Constants values at 0 are Array of Integer" do
    assert do
      ::Berean::CONSTANTS.values.all? do |value|
        value[0].all?{|val| val.instance_of? Integer}
      end
    end
  end

  test "Constants values at 1 are Array of String" do
    assert do
      ::Berean::CONSTANTS.values.all? do |value|
        value[1].all?{|val| val.instance_of? String}
      end
    end
  end
end