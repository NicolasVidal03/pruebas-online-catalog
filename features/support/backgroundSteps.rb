Before do
  @home_page = HomePage.new
end

# Given I am on the GMO homepage
Given(/^I am on the GMO homepage$/) do
    page.driver.browser.manage.window.maximize
    @home_page = HomePage.new
    @home_page.visit_homepage
end