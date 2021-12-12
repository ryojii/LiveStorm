# frozen_string_literal: true

require 'spec_helper'

describe 'Authentication "Happy path"' do
  before { 
    @driver = Selenium::WebDriver.for(:remote, :url => "https://jeromeaiguillon_WT6VE1:Xq2JZQvpx4U23zoKTUCw@hub-cloud.browserstack.com/wd/hub")
    @driver.navigate.to "https://www.saucedemo.com"
  }

  it 'successful' do
    puts "title of webpage is: #{@driver.title}"
    username_locator = {css: '#user-name'}
    password_locator = {css: '#password'}
    submit_locator = {css: '.btn_action'}

    wait = Selenium::WebDriver::Wait.new
    wait.until { @driver.find_element(username_locator).displayed? }

    username_element = @driver.find_element(username_locator)
    password_element = @driver.find_element(password_locator)
    submit_element = @driver.find_element(submit_locator)

    username_element.send_keys 'standard_user'
    password_element.send_keys 'secret_sauce'
    submit_element.click

    expect(@driver.current_url).to eq 'https://www.saucedemo.com/inventory.html'
  end
end
