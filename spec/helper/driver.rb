# driver.rb

require 'selenium-webdriver'

class Driver

  def initialize()
    if $driver == nil 
      $driver = Selenium::WebDriver.for(:remote, :url => "https://user:tokenw@hub-cloud.browserstack.com/wd/hub")
    else
      $driver = nil
      $driver = Selenium::WebDriver.for(:remote, :url => "https://user:token@hub-cloud.browserstack.com/wd/hub")
    end
  end
end
