  # Given I fill the "Order quantity" field for "3 Person Dome Tent" with "2"
  Given(/^I fill the "Order quantity" field for "([^"]+)" with "([^"]+)"$/) do |item_name, value|
    product_name_css = "body > form > table > tbody > tr:nth-child(2) > td > div > center > table > tbody > tr > td:nth-child(2)"
    product_names = all(product_name_css).map(&:text)
  
    index = product_names.index(item_name)
    raise "Item not found: #{item_name}" if index.nil?
  
    quantity_input_selector = "body > form > table > tbody > tr:nth-child(2) > td > div > center > table > tbody > tr:nth-child(#{index + 1}) > td:nth-child(4) > h1 > input[type='text']"
    find(quantity_input_selector).set(value)
  end
  
  
  # Given I fill the "Order quantity" fields as shown below:
  Given(/^I fill the "Order quantity" fields as shown below:$/) do |table|
    product_name_css = "body > form > table > tbody > tr:nth-child(2) > td > div > center > table > tbody > tr > td:nth-child(2)"
    product_names = all(product_name_css).map(&:text)
  
    table.hashes.each do |row|
      item_name = row['Item Name']
      order_quantity = row['Order Quantity']
  
      index = product_names.index(item_name)
      raise "Item not found: #{item_name}" if index.nil?
  
      quantity_input_selector = "body > form > table > tbody > tr:nth-child(2) > td > div > center > table > tbody > tr:nth-child(#{index + 1}) > td:nth-child(4) > h1 > input[type='text']"
      find(quantity_input_selector).set(order_quantity)
    end
  end
  
  
  # Then all "Order quantity" fields should be reset to "0"
  Then(/^all "Order quantity" fields should be reset to "0"$/) do
    all(:xpath, "//input[@type='text']").each do |field|
      expect(field.value).to eq("0")
    end
  end
  
  
  # Then the "Order quantity" field for "3 Person Dome Tent" should be reset to "0"
  Then(/^the "Order quantity" field for "([^"]+)" should be reset to "([^"]+)"$/) do |item_name, expected_value|
    product_name_css = "body > form > table > tbody > tr:nth-child(2) > td > div > center > table > tbody > tr > td:nth-child(2)"
    product_names = all(product_name_css).map(&:text)
  
    index = product_names.index(item_name)
    raise "Item not found: #{item_name}" if index.nil?
  
    quantity_input_selector = "body > form > table > tbody > tr:nth-child(2) > td > div > center > table > tbody > tr:nth-child(#{index + 1}) > td:nth-child(4) > h1 > input[type='text']"
    actual_value = find(quantity_input_selector).value
    expect(actual_value).to eq(expected_value)
  end
  
  

  
  def find_item_selector(item_name)
    selectors = {
      "3 Person Dome Tent" => "input[name='quantity_tent']",
      "External Frame Backpack" => "input[name='quantity_backpack']",
      "Glacier Sun Glasses" => "input[name='quantity_glasses']",
      "Padded Socks" => "input[name='quantity_socks']",
      "Hiking Boots" => "input[name='quantity_boots']",
      "Back Country Shorts" => "input[name='quantity_shorts']"
    }
    selector = selectors[item_name]
    if selector
      selector
    else
      raise("Selector no definido para el item: #{item_name}")
    end
  end
    