# frozen_string_literal: true

require 'spec_helper'
require_relative './model/login.rb'
require_relative './helper/driver.rb'

describe '"None shall pass!" Authentication'  do
  before { 
    Driver.new
    $driver.navigate.to "https://www.saucedemo.com"
  }

  it 'fail for locked account' do
    puts "Start page title is: #{$driver.title}"
    page = Login.new

    page.do_login('locked_out_user', 'secret')
    @result = expect($driver.current_url).to eq 'https://www.saucedemo.com/'
  end
end
