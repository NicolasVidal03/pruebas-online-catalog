# And I see a confirmation dialog with the message "alert name."
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

# When I click on the "name_button" button
When(/^I click on the "([^"]*)" button$/) do |button_name|
    click_button(button_name)
  end  

#Then I should see the title {title}
Then('I should see the title {string}') do |title|
  expect(page).to have_selector('h1', text: title)
end

# When I add the following items to the order with their respective quantities:
When('I add the following items to the order with their respective quantities:') do | table |
  table.hashes.each do |row|
    step %{I add #{row['Quantity']} "#{row['Item']}" to the order}
  end
end

#I should see an alert "####"
Then('I should see an alert {string}') do | alertMessage|
  alert = page.driver.browser.switch_to.alert
  expect(alertMessage).to include(alert.text)
end