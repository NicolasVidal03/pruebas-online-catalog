Before do
  @catalog_page = CatalogPage.new
end

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
  @catalog_page.add_product_to_order(qty, item_name)
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
    step %{I add #{row['Quantity']} item of "#{row['Item']}" to the order}
  end
end

#I should see an alert "####"
Then('I should see an alert {string}') do | alertMessage|
  alert = page.driver.browser.switch_to.alert
  expect(alertMessage).to include(alert.text)
end

# When I enter abc in the "Order Quantity" field for "3 Person Dome Tent"
When('I enter {string} in the Order Quantity field for 3 Person Dome Tent') do |quantity|
  quantity_table = "body > form > table > tbody > tr:nth-child(2) > td > div > center > table > tbody > tr:nth-child(2) > td:nth-child(4) > h1 > input[type=text]"
  find(quantity_table).set(quantity) 
end