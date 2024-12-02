# Given I am on the GMO homepage
Given(/^I am on the GMO homepage$/) do
    page.driver.browser.manage.window.maximize
    visit('https://demo.borland.com/gmopost/')
  end

# When I click on the xxxx button
When(/^I click on the "([^"]*)" button$/) do |button_name|
  click_button(button_name)
end  






















































# And I press "Place An Order"
And('I press "Place An Order"') do
  click_button('Place An Order') # Haz clic en el botón para realizar el pedido
end

# And I see a confirmation dialog with the message "Please enter only digits in this field."
And(/^I see a confirmation dialog with the message "([^"]*)"$/) do |message|
  alert = page.driver.browser.switch_to.alert
  expect(alert.text).to eq(message)
end

# And I click the "Aceptar" button in the confirmation dialog
And(/^I click the "Aceptar" button in the confirmation dialog$/) do
  page.driver.browser.switch_to.alert.accept
end
