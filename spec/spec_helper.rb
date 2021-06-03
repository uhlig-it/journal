# frozen_string_literal: true

require 'capybara/rspec'

ENV['RACK_ENV'] = 'test'
ENV['DB'] = 'mock://postgres'

RSpec.configure do |config|
  config.filter_run :focus
  config.run_all_when_everything_filtered = true
end
