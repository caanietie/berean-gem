# frozen_string_literal: true

require "yaml"
require "test-unit"
require "#{__dir__}/../lib/berean"

$test_data = YAML.load_file("#{__dir__}/berean.yml")
def berean index
  Berean.from_h $test_data[index.to_s]
end