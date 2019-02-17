require "test_helper"
require 'selenium-webdriver'
require 'capybara'

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  caps = Selenium::WebDriver::Remote::Capabilities.chrome("chromeOptions" => {"args" => %w(--headless --no-sandbox)})
  driven_by :selenium, using: :chrome, screen_size: [1400, 1400], options: { desired_capabilities: caps }
end
