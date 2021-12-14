# frozen_string_literal: true

require 'spec_helper'
require_relative './model/login.rb'

describe '"None shall pass!" Authentication'  do
  before { 
    $driver.navigate.to "https://www.saucedemo.com"
  }

  it 'fail for wrong credentials' do
    puts "title of webpage is: #{$driver.title}"
    page = Login.new

    page.do_login( 'standard', 'secret')
    @result = expect($driver.current_url).to eq 'https://www.saucedemo.com/'
  end
end
