# spec_helper.rb
require 'capybara/rspec'
require 'capybara/dsl'
require_relative './helper/BS_Formatter'

# set up driver
Capybara.register_driver :headless_chrome do |app|
  Capybara::Selenium::Driver.new(
    app,
    browser: :chrome,
    http_client: client,
    options: options)
end

## set up client
require 'selenium-webdriver'
client = Selenium::WebDriver.for :chrome # see also following link.

## set up options
options = Selenium::WebDriver::Chrome::Options.new.tap do |opts|
  opts.args << '--headless'
end

# configure
Capybara.configure do |config|
  config.ignore_hidden_elements = true
  config.default_max_wait_time = 3 #sec
end

