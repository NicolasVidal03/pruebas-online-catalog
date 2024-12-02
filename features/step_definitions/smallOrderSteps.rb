#When I add <Qty> item of "<Item Name>" to the order
When('I add {int} item of {string} to the order') do |qty, item_name|
    product_name_css = "body > form > table > tbody > tr:nth-child(2) > td > div > center > table > tbody > tr > td:nth-child(2)"
    product_names = all(product_name_css).map(&:text)
    index = product_names.index(item_name)
    
    quantity_input_selector = "body > form > table > tbody > tr:nth-child(2) > td > div > center > table > tbody > tr:nth-child(#{index + 1}) > td:nth-child(4) > h1 > input[type=text]"
    find(quantity_input_selector).set(qty)
end
  
# Then I should see the following order details for the only item:
Then('I should see the following order details for the only item:') do |table|

    qty_page = find('body > form > table > tbody > tr:nth-child(1) > td > div > center > table > tbody > tr:nth-child(2) > td:nth-child(1)')
    product_desc_page = find('body > form > table > tbody > tr:nth-child(1) > td > div > center > table > tbody > tr:nth-child(2) > td:nth-child(2)')
    delivery_status_page = find('body > form > table > tbody > tr:nth-child(1) > td > div > center > table > tbody > tr:nth-child(2) > td:nth-child(3)')
    unit_price_page = find('body > form > table > tbody > tr:nth-child(1) > td > div > center > table > tbody > tr:nth-child(2) > td:nth-child(4)')
    total_price_page = find('body > form > table > tbody > tr:nth-child(1) > td > div > center > table > tbody > tr:nth-child(2) > td:nth-child(5)')
    
    table.hashes.each do |row|
        qty_page_table = row['Qty']
        product_desc_table = row['Product Description']
        delivery_status_table = row['Delivery Status']
        unit_price_table = row['Unit Price']
        total_price_table = row['Total Price']

        expect(qty_page.text).to have_content(qty_page_table)
        expect(product_desc_page.text).to have_content(product_desc_table)
        expect(delivery_status_page.text).to have_content(delivery_status_table)
        expect(unit_price_page.text).to have_content(unit_price_table)
        expect(total_price_page.text).to have_content(total_price_table)
    end
end
  
# And I should see the Product Total information below:
And('I should see the Product Total information below:') do |table|
  product_total_page = find("body > form > table > tbody > tr:nth-child(1) > td > div > center > table > tbody > tr:nth-child(3) > td:nth-child(3)")
  sales_tax_page = find("body > form > table > tbody > tr:nth-child(1) > td > div > center > table > tbody > tr:nth-child(4) > td:nth-child(2)")
  shipping_handling_page = find("body > form > table > tbody > tr:nth-child(1) > td > div > center > table > tbody > tr:nth-child(5) > td:nth-child(2)")
  grand_total_page = find("body > form > table > tbody > tr:nth-child(1) > td > div > center > table > tbody > tr:nth-child(6) > td:nth-child(2) > strong")

  table.hashes.each do |row|
    product_total_table = row['Product Total']
    sales_tax_table = row['Sales Tax']
    shipping_handling_table = row['Shipping & Handling']
    grand_total_table = row['Grand Total']

    expect(product_total_page.text).to have_content(product_total_table)
    expect(sales_tax_page.text).to have_content(sales_tax_table)
    expect(shipping_handling_page.text).to have_content(shipping_handling_table)
    expect(grand_total_page.text).to have_content(grand_total_table)
  end
end


# When I enter abc in the "Order Quantity" field for "3 Person Dome Tent"
When('I enter {string} in the Order Quantity field for 3 Person Dome Tent') do |quantity|
  quantity_table = "body > form > table > tbody > tr:nth-child(2) > td > div > center > table > tbody > tr:nth-child(2) > td:nth-child(4) > h1 > input[type=text]"
  find(quantity_table).set(quantity) 
end




# And I see the follow table:
And('I see the follow table:') do |expected_table|
  actual_table = find('body > form > table > tbody > tr:nth-child(2) > td > div > center > table') # Encuentra la tabla en la página
  rows = actual_table.all('tr') 

  expected_table.hashes.each_with_index do |expected_row, index|
    row = rows[index + 1] 
    columns = row.all('td').map(&:text) 
    expect(columns).to eq(expected_row.values)
  end
end

  