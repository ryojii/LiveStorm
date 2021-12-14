# driver.rb

require 'selenium-webdriver'

class Driver

  def initialize()
    if $driver == nil 
      $driver = Selenium::WebDriver.for(:remote, :url => "https://jeromeaiguillon_WT6VE1:Xq2JZQvpx4U23zoKTUCw@hub-cloud.browserstack.com/wd/hub")
    else
      $driver = nil
      $driver = Selenium::WebDriver.for(:remote, :url => "https://jeromeaiguillon_WT6VE1:Xq2JZQvpx4U23zoKTUCw@hub-cloud.browserstack.com/wd/hub")
    end
  end
end
