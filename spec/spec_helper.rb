# spec_helper.rb

require 'capybara/rspec'
require 'capybara/dsl'
require 'selenium-webdriver'

require_relative './helper/BS_Formatter'

## set up driver as a global var, I suppose there is a better way to do this.
#if $driver == nil 
#  $driver = Selenium::WebDriver.for(:remote, :url => "https://jeromeaiguillon_WT6VE1:Xq2JZQvpx4U23zoKTUCw@hub-cloud.browserstack.com/wd/hub")
#end

# configure
Capybara.configure do |config|
  config.ignore_hidden_elements = true
  config.default_max_wait_time = 3 #sec
end

