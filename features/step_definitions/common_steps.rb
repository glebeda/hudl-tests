require 'dotenv'
Dotenv.load

Given(/^I am on the ([^\s]+Page)$/) do |page_name|
  visit page_name
end

When(/^I (click_[^\s]*) on the ([^\s]*Page)$/) do |button_name, page_name|
  on page_name do |page|
    page.send("#{button_name}!")
  end
end

Then(/^I (should|should not) see the (.*) on the ([^\s]*Page)$/) do |verify_type, component, page_name|
  method =
    case verify_type
    when 'should'
      "#{component}_visible?"
    when 'should not'
      "#{component}_not_visible?"
    else
      raise "#{verify_type} is not valid. Use 'should' or 'should not'."
    end

    on(page_name) do |page|
      expect(page.send(method)).to be_truthy, "Expected #{component} to #{verify_type.gsub('should', 'be').gsub('should not', 'not be')} visible"
    end
end

And(/^I fill ([^\s]+) field on ([^\s]*Page) with (?:the value (.*)|environment variable ([^\s]+))$/) do |field_name, page_name, value, env_var|
  actual_value = env_var ? ENV[env_var] : value

  on page_name do |page|
    page.send("fill_#{field_name}!", actual_value)
  end
end

Then(/^I (should|should not) see (.*) text in (.*) on the ([^\s]*Page)$/) do |verify_type, text, item, page_name|
  on page_name do |page|
    actual_text = page.send("#{item}_text")

    if verify_type == 'should'
      expect(actual_text).to include(text), "Expected #{item} to include '#{text}', but got '#{actual_text}'"
    else
      expect(actual_text).not_to include(text), "Expected #{item} to NOT include '#{text}', but got '#{actual_text}'"
    end
  end
end

Then /^I should see the ([^\s]+Page)$/ do |page_name|
  wait_until_page_loaded page_name
end