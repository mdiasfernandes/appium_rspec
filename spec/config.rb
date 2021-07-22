require 'rubygems'
require 'appium_lib'

def server_url
  'http://192.168.0.102:4723/wd/hub'
end

opts_ios = {
  caps: {
    app: '/Users/matheus/Downloads/qazandoapp.app',
    udid: 'CE43487F-E369-4FCF-BBF1-A24D9C5563E1',
    automationName: 'XCUITest',
    platformName: 'iOS',
    platformVersion: '14.5',
    deviceName: 'iPhone 8 Plus',
    nativeWebTap: true,
    fullReset: true,
    autoAcceptAlerts: true,
    showXcodeLog: false,
  },
  appium_lib: {
    wait_timeout: 30,
    server_url: server_url
  }
}

opts_android = {
  caps: {
    app: '/Users/matheus/Downloads/app-homolog.apk',
    platformName: 'Android',
    automationName: 'UIAutomator2',
    deviceName: 'emulator-5554',
    nativeWebTap: true,
    fullReset: true,
    autoAcceptAlerts: true,
  },
  appium_lib: {
    wait_timeout: 30,
    server_url: server_url
  }
}

RSpec.configure do |config|
  config.before(:suite) do
    @implicit_wait_timeout = 15
    @driver = Appium::Driver.new(opts_ios, true).start_driver
    # @driver = Appium::Driver.new(opts_android, true).start_driver
    @driver.manage.timeouts.implicit_wait = @implicit_wait_timeout
    Appium.promote_appium_methods Object
  end

  config.after(:all) do
    @driver.driver_quit
  end
end
