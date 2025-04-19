require 'dotenv/load'
require 'watir'
require 'page-object'
require 'rspec/expectations'
require 'selenium-webdriver'

Before do |scenario|
  begin
    browser_name = ENV['BROWSER'] || 'chrome'
    headless = ENV['HEADLESS'] == 'false'
  
    options = Selenium::WebDriver::Chrome::Options.new
    options.add_argument('--headless') if headless
  
    @browser = Watir::Browser.new browser_name, options: options
    @browser.window.maximize
  rescue => e
    puts "Error initializing browser: #{e.message}"
    raise e
  end
end

After do |scenario|
  if @browser
    if scenario.failed?
      screenshot = "./reports/screenshots/#{scenario.name.gsub(' ', '_')}.png"
      @browser.screenshot.save screenshot
    end
    @browser.close
  end
end

# Load all page objects
Dir[File.dirname(__FILE__) + '/../../pages/*.rb'].each { |file| require file } 