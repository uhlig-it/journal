# frozen_string_literal: true

require 'spec_helper'
require 'rack/test'
require_relative '../../app'

describe 'Journal' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  it 'has a root page' do
    get '/'
    expect(last_response).to be_ok
  end
end
