# inventory.rb

require 'selenium-webdriver'

class Inventory

  def initialize()
    @menu_button_locator = {css: '#react-burger-menu-btn'}
    @menu_close_button_locator = {css: '#react-burger-cross-btn'}
    @menu_logout_button_locator = {css: '#logout_sidebar_link'}
    wait_to_be_loaded
  end

  def open_menu()
    return $driver.find_element(@menu_button_locator)
  end

  def close_menu()
    return $driver.find_element(@menu_close_button_locator)
  end

  def logout()
    return $driver.find_element(@menu_logout_button_locator)
  end

  def do_logout()
    open_menu.click

    #have to wait for menu to be displayed
    wait = Selenium::WebDriver::Wait.new
    wait.until { $driver.find_element(@menu_close_button_locator).displayed? }
    
    logout.click
  end

  def wait_to_be_loaded()
    wait = Selenium::WebDriver::Wait.new
    wait.until { $driver.find_element(@menu_button_locator).displayed? }
  end

end
