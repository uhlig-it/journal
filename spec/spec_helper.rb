# frozen_string_literal: true

RSpec.configure do |config|
  config.filter_run :focus
  config.run_all_when_everything_filtered = true
end

def fixture(path)
  Pathname(__dir__).join('fixtures', path)
end
