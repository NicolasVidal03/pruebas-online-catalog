# Given I am on the GMO homepage
Given(/^I am on the GMO homepage$/) do
    page.driver.browser.manage.window.maximize
    visit('https://demo.borland.com/gmopost/')
  end
