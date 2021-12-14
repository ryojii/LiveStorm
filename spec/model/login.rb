# login.rb

require 'selenium-webdriver'

class Login
    
  def initialize()
    @username_locator = {css: '#user-name'}
    @password_locator = {css: '#password'}
    @submit_locator = {css: '#login-button'}
    @error_message_locator = {css: '.error-message-container > h3'}
    wait_to_be_loaded
  end

  def login_username()
    return $driver.find_element(@username_locator)
  end

  def login_password()
    return $driver.find_element(@password_locator)
  end

  def submit_button()
    return $driver.find_element(@submit_locator)
  end

  def error_message
    return $driver.find_element(@error_message_locator)
  end

  def do_login(username, password)
    login_username.send_keys(username)
    login_password.send_keys(password)
    submit_button().click
  end

  def wait_to_be_loaded()
    wait = Selenium::WebDriver::Wait.new
    wait.until { $driver.find_element(@username_locator).displayed? }
  end

end

