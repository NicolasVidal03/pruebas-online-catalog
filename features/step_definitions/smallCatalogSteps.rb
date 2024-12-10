  #  And I see the text: These are the items currently available through our online catalog. Select the quantity of each item and then press the "Place An Order" button at the bottom of the page.
  And(/^I see the text: (.*)$/) do |text_info|
    expect(page).to have_content(text_info)
  end
  
  # Then I should see the following items along with their unit price and order quantity:
  Then(/^I should see the following items along with their unit price and order quantity:$/) do |table|
    table.hashes.each_with_index do |row, index|
      item_number_selector = " body > form > table > tbody > tr:nth-child(2) > td > div > center > table > tbody > tr:nth-child(#{index + 2}) > td:nth-child(1)"
      item_name_selector = " body > form > table > tbody > tr:nth-child(2) > td > div > center > table > tbody > tr:nth-child(#{index + 2}) > td:nth-child(2) > a > strong"
      unit_price_selector = " body > form > table > tbody > tr:nth-child(2) > td > div > center > table > tbody > tr:nth-child(#{index + 2}) > td:nth-child(3)"
      order_quantity_selector = "body > form > table > tbody > tr:nth-child(2) > td > div > center > table > tbody > tr:nth-child(#{index + 2}) > td:nth-child(4) > h1 > input[type='text']"
  
      expect(find(item_number_selector).text.strip).to eq(row['Item Number'])
      expect(find(item_name_selector).text.strip).to eq(row['Item Name'])
      expect(find(unit_price_selector).text.strip).to eq(row['Unit Price'])
      expect(find(order_quantity_selector).value).to eq(row['Order Quantity'])
    end
  end
  
  
  # Given I look for the "Reset Form" or "Place An Order" button
  Given(/^I look for the "([^"]*)" button$/) do |name_button|
    @button = find_button(name_button) 
  end
  
  # Then the "Reset Form" or "Place An Order" button should be visible
  Then(/^the "([^"]*)" button should be visible$/) do |name_button|
    expect(@button).to be_visible 
  end
  
  
    