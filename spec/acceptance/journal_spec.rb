require 'webdrivers'
require 'capybara/rspec'

require_relative '../../app'

Capybara.app = Sinatra::Application
Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(
    app,
    browser: :chrome,
    options: Selenium::WebDriver::Chrome::Options.new(
      args: %w[no-sandbox headless disable-gpu]
    )
  )
end

describe 'new post', type: :feature do
  let(:text) { "#{('a'..'z').to_a.sample(8).join} from #capybara" }

  it 'creates a new post' do
    visit '/'

    within('form') do
      fill_in 'text', with: text
    end

    click_button 'Post'

    expect(page).to have_content(text)
  end
end
