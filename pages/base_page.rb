class BasePage
  include PageObject

  BASE_URL = ENV['BASE_URL'] || 'https://www.hudl.com'
end 