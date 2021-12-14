# frozen_string_literal: true

require 'spec_helper'

require_relative 'model/login.rb'
require_relative 'model/inventory.rb'
require_relative 'helper/driver.rb'

describe '"Happy path" Authentication' do
  before { 
    Driver.new
    $driver.navigate.to "https://www.saucedemo.com"
  }

  it 'successful' do
      puts "Start page title is: #{$driver.title}"

      page = Login.new
      page.do_login('standard_user', 'secret_sauce')

      page = Inventory.new

      expect($driver.current_url).to eq 'https://www.saucedemo.com/inventory.html'

      page.do_logout
      expect($driver.current_url).to eq 'https://www.saucedemo.com/'
  end
end
