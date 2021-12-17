require 'capybara/cucumber'
require 'selenium-webdriver'
require 'pry'
require 'rspec'

Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app,
    :browser => :chrome,
    :capabilities => Selenium::WebDriver::Remote::Capabilities.chrome(
      'goog:chromeOptions' => {
        'args' => [ "--window-size=1920,1080" ]
      }
    )
  )
end

Capybara.default_driver = :chrome
Capybara.default_selector = :css
