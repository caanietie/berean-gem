# frozen_string_literal: true

require_relative "test_helper"

class VersionTest < Test::Unit::TestCase
  test "VERSION" do
    assert do
      ::Berean.const_defined? :VERSION
    end
  end

  test "VERSION should be a String" do
    assert_instance_of String, ::Berean::VERSION
  end
end
