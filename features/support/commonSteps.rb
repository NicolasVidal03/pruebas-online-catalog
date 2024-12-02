# And I see a confirmation dialog with the message "Please enter only digits in this field."
And(/^I see a confirmation dialog with the message "([^"]*)"$/) do |message|
  alert = page.driver.browser.switch_to.alert
  expect(alert.text).to eq(message)
end

# And I click the "Aceptar" button in the confirmation dialog
And(/^I click the "Aceptar" button in the confirmation dialog$/) do
  page.driver.browser.switch_to.alert.accept
end

#When I add <Qty> item of "<Item Name>" to the order
When('I add {int} item of {string} to the order') do |qty, item_name|
    product_name_css = "body > form > table > tbody > tr:nth-child(2) > td > div > center > table > tbody > tr > td:nth-child(2)"
    product_names = all(product_name_css).map(&:text)
    index = product_names.index(item_name)
    
    quantity_input_selector = "body > form > table > tbody > tr:nth-child(2) > td > div > center > table > tbody > tr:nth-child(#{index + 1}) > td:nth-child(4) > h1 > input[type=text]"
    find(quantity_input_selector).set(qty)
end

# When I click on the xxxx button
When(/^I click on the "([^"]*)" button$/) do |button_name|
    click_button(button_name)
  end  
  