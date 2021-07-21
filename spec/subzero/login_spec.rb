# frozen_string_literal: true

require 'spec_helper'

describe 'subzero login' do
  context 'login path done successfuly' do
    it 'happy path' do
      login_field = driver.find_element(:xpath, '//XCUIElementTypeTextField[@name="email"]')
      login_field.send_keys("BrowserStack")
      password_field = driver.find_element(:xpath, '//XCUIElementTypeSecureTextField[@name="senha"]')
      password_field.send_keys("BrowserStack")
    end
  end
end
