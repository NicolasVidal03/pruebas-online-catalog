# Given I am on the GMO homepage
Given(/^I am on the GMO homepage$/) do
    page.driver.browser.manage.window.maximize
    visit('https://demo.borland.com/gmopost/')
  end

# When I click on the xxxx button
When(/^I click on the "([^"]*)" button$/) do |button_name|
  click_button(button_name)
end  