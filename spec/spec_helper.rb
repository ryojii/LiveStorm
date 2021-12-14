# spec_helper.rb

require 'capybara/rspec'
require 'capybara/dsl'
require 'selenium-webdriver'

require_relative './helper/BS_Formatter'

# configure
Capybara.configure do |config|
  config.ignore_hidden_elements = true
  config.default_max_wait_time = 3 #sec
end

