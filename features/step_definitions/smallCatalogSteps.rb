Before do
  @catalog_page = CatalogPage.new
end

# And I see the text: These are the items currently available through our online catalog. Select the quantity of each item and then press the "Place An Order" button at the bottom of the page.
And(/^I see the text: (.*)$/) do |text_info|
  expect(@catalog_page.text_visible?(text_info)).to be true
end

# Then I should see the following items along with their unit price and order quantity:
Then(/^I should see the following items along with their unit price and order quantity:$/) do |table|
  @catalog_page.verify_catalog_items(table.hashes)
end

# Given I look for the "Reset Form" o "Place An Order" button 
Given(/^I look for the "([^"]*)" button$/) do |button_name|
  @button = @catalog_page.find_button_by_name(button_name)
end

# Then the "Reset Form" o "Place An Order" button should be visible
Then(/^the "([^"]*)" button should be visible$/) do |button_name|
  expect(@catalog_page.button_visible?(button_name)).to be true
end
