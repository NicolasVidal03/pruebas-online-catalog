# And I set the quantity input to "1" for the "3 Person Dome Tent"
And(/^I set the quantity input to "([^"]*)" for the "([^"]*)"$/) do |quantity, product_name|
  product_row = all('tr').find do |row|
    row.all('td')[1]&.text&.include?(product_name)
  end
  within(product_row) do
    price_text = all('td')[2]&.text 
    raise "Price text not found for #{product_name}" if price_text.nil?

    unit_price = price_text.match(/\$ ([\d,]+\.\d{2})/)[1].to_f

    @quantity = quantity.to_i
    @total_price = unit_price * @quantity

    all('input[type="text"]')[0].set(quantity)
  end
end 

# Then I should see the billing form
Then(/^I should see the billing form$/) do
    bill_inputs = all("input") 
    expected_bill_inputs = ["billName", "billAddress", "billCity", "billState", "billZipCode", "billPhone", "billEmail", "CardNumber", "CardDate","shipName", "shipAddress", "shipCity", "shipState", "shipZipCode", "shipPhone"]
    
    expected_bill_inputs.each do |name|
      input = bill_inputs.find { |input| input[:name] == name }
      expect(input).to be_visible
    end
  end
  
# When I fill in the billing information
When(/^I fill in the billing information:$/) do |table|
    table.hashes.each do |row|
  
      if row['Field'] == 'Name'
        @bill_name = row['Value']
        find('[name="billName"]').set(row['Value'])
      elsif row['Field'] == 'Address'
        @bill_address = row['Value']
        find('[name="billAddress"]').set(row['Value'])
      elsif row['Field'] == 'City'
        @bill_city = row['Value']
        find('[name="billCity"]').set(row['Value'])
      elsif row['Field'] == 'State'
        @bill_state = row['Value']
        find('[name="billState"]').set(row['Value'])
      elsif row['Field'] == 'Zip'
        @bill_zip_code = row['Value']
        find('[name="billZipCode"]').set(row['Value'])
      elsif row['Field'] == 'Phone'
        @bill_phone = row['Value']
        find('[name="billPhone"]').set(row['Value'])
      elsif row['Field'] == 'E-mail'
        @bill_email = row['Value']
        find('[name="billEmail"]').set(row['Value'])
      elsif row['Field'] == 'Credit Card'
        @card_type = row['Value']
        find('[name="CardType"]').select(row['Value'])
      elsif row['Field'] == 'Card Number'
        @card_number = row['Value']
        find('[name="CardNumber"]').set(row['Value'])
      elsif row['Field'] == 'Expiration Date'
        @card_date = row['Value']
        find('[name="CardDate"]').set(row['Value'])
      end
    end
  end

# And I click on the "Place The Order" button
  And(/^I fill in the shipping information:$/) do |table|
    table.hashes.each do |row|
  
      if row['Field'] == 'Name'
        @ship_name = row['Value']
        find('[name="shipName"]').set(row['Value'])
      elsif row['Field'] == 'Address'
        @ship_addres = row['Value']
        find('[name="shipAddress"]').set(row['Value'])
      elsif row['Field'] == 'City'
        @ship_city = row['Value']
        find('[name="shipCity"]').set(row['Value'])
      elsif row['Field'] == 'State'
        @ship_state = row['Value']
        find('[name="shipState"]').set(row['Value'])
      elsif row['Field'] == 'Zip'
        @ship_zip_code = row['Value']
        find('[name="shipZipCode"]').set(row['Value'])
      elsif row['Field'] == 'Phone'
        @ship_phone = row['Value']
        find('[name="shipPhone"]').set(row['Value'])
      end
    end
  end

# Then I should see the order receipt with Product Total, Sales Tax, Shipping & Handling and Grand Total
Then(/^I should see the order receipt with Product Total, Sales Tax, Shipping & Handling and Grand Total$/) do
    @sales_tax = (@total_price * 0.05).round(2)
    @shipping_cost ||= 5.0 
  
    grand_total = (@total_price + @sales_tax + @shipping_cost).round(2)
  
    expect(page).to have_content("Product Total $ #{@total_price.round(2)}")
    expect(page).to have_content("Sales Tax $ #{@sales_tax}")
    expect(page).to have_content("Shipping & Handling $ #{@shipping_cost}")
    expect(page).to have_content("Grand Total $ #{grand_total}")
end

# And I click on the "Same as 'Bill To'" checkbox
And(/^I click on the "Same as 'Bill To'" checkbox$/) do
    find('input[name="shipSameAsBill"]').click
end
  
# Then the shipping information should be automatically filled with the following:
Then(/^the shipping information should be automatically filled with the following:$/) do |table|
    table.hashes.each do |row|
      field_name = row['Field']
      expected_value = row['Value']
  
      actual_value = find("[name='ship#{field_name}']").value
      expect(actual_value).to eq(expected_value), "Expected #{field_name} to be '#{expected_value}', but got '#{actual_value}'"
    end
end