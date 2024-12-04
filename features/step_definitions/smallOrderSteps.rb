def get_page_text(selector)
  find(selector).text.strip
end

def clean_numeric_value(text)
  text.gsub(/[^\d.]/, '').to_f
end

def format_currency(value)
  format("$ %.2f", value)
end

selectors_table_Place_order = {
  qty: 'body > form > table > tbody > tr:nth-child(1) > td > div > center > table > tbody > tr:nth-child(2) > td:nth-child(1)',
  product_desc: 'body > form > table > tbody > tr:nth-child(1) > td > div > center > table > tbody > tr:nth-child(2) > td:nth-child(2)',
  delivery_status: 'body > form > table > tbody > tr:nth-child(1) > td > div > center > table > tbody > tr:nth-child(2) > td:nth-child(3)',
  unit_price: 'body > form > table > tbody > tr:nth-child(1) > td > div > center > table > tbody > tr:nth-child(2) > td:nth-child(4)',
  total_price: 'body > form > table > tbody > tr:nth-child(1) > td > div > center > table > tbody > tr:nth-child(2) > td:nth-child(5)',
  product_total: 'body > form > table > tbody > tr:nth-child(1) > td > div > center > table > tbody > tr:nth-child(3) > td:nth-child(3)',
  sales_tax: 'body > form > table > tbody > tr:nth-child(1) > td > div > center > table > tbody > tr:nth-child(4) > td:nth-child(2)',
  shipping_handling: 'body > form > table > tbody > tr:nth-child(1) > td > div > center > table > tbody > tr:nth-child(5) > td:nth-child(2)',
  grand_total: 'body > form > table > tbody > tr:nth-child(1) > td > div > center > table > tbody > tr:nth-child(6) > td:nth-child(2) > strong',
  product_names: "body > form > table > tbody > tr:nth-child(2) > td > div > center > table > tbody > tr > td:nth-child(2)",
}

# Then I should see the following order details for the only item:
Then('I should see the following order details for the only item:') do |table|

  row = table.hashes.first
  qty_table = row['Qty']
  product_desc_table = row['Product Description']
  delivery_status_table = row['Delivery Status']
  unit_price_table = row['Unit Price']
  shipping_handling_table = row['Shipping & Handling']
  sales_tax_rate = 0.05


  qty_page_value = get_page_text(selectors_table_Place_order[:qty]).to_i
  unit_price_value = clean_numeric_value(get_page_text(selectors_table_Place_order[:unit_price]))
  total_price_value = clean_numeric_value(get_page_text(selectors_table_Place_order[:total_price]))
  sales_tax_value = clean_numeric_value(get_page_text(selectors_table_Place_order[:sales_tax]))
  shipping_handling_value = clean_numeric_value(get_page_text(selectors_table_Place_order[:shipping_handling]))
  grand_total_value = clean_numeric_value(get_page_text(selectors_table_Place_order[:grand_total]))
  puts grand_total_value


  calculated_product_total = (unit_price_value * qty_page_value).round(2)
  calculated_sales_tax_value = (calculated_product_total * sales_tax_rate).round(2)
  calculated_grand_total_value = (calculated_product_total + calculated_sales_tax_value + shipping_handling_value).round(2)


  formatted_total_price = format_currency(calculated_product_total)
  formatted_sales_tax = format_currency(calculated_sales_tax_value)
  formatted_grand_total = format_currency(calculated_grand_total_value)


  puts "#{calculated_product_total} + #{sales_tax_value} + #{shipping_handling_value} = #{formatted_grand_total}"


  expect(get_page_text(selectors_table_Place_order[:qty])).to have_content(qty_table)
  expect(get_page_text(selectors_table_Place_order[:product_desc])).to have_content(product_desc_table)
  expect(get_page_text(selectors_table_Place_order[:delivery_status])).to have_content(delivery_status_table)
  expect(get_page_text(selectors_table_Place_order[:unit_price])).to have_content(unit_price_table)
  expect(get_page_text(selectors_table_Place_order[:total_price])).to eq(formatted_total_price)
  expect(get_page_text(selectors_table_Place_order[:sales_tax])).to have_content(formatted_sales_tax)
  expect(get_page_text(selectors_table_Place_order[:shipping_handling])).to have_content(shipping_handling_table)
  expect(get_page_text(selectors_table_Place_order[:grand_total])).to have_content(formatted_grand_total)
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




# When I add <Qty> quantities of all the items <Item Name>
When('I add {int} quantities of all the items {string}') do |qty, item_name|
    product_name_css = selectors_table_Place_order[:product_names]
    product_names = all(product_name_css).map(&:text)
    index = product_names.index(item_name)

    quantity_input_selector = "body > form > table > tbody > tr:nth-child(2) > td > div > center > table > tbody > tr:nth-child(#{index + 1}) > td:nth-child(4) > h1 > input[type=text]"
    find(quantity_input_selector).set(qty)
end


When('I add all items of the catalog') do |table|
  product_name_css = selectors_table_Place_order[:product_names]
  product_names = all(product_name_css).map(&:text)
  table.rows.each do |row|
    qty = row[0]               
    product_desc = row[1]     
    index = product_names.index(product_desc)
    quantity_input_selector = "body > form > table > tbody > tr:nth-child(2) > td > div > center > table > tbody > tr:nth-child(#{index + 1}) > td:nth-child(4) > h1 > input[type=text]"
    find(quantity_input_selector).set(qty)
  end
end

And('I should see:') do |table|
  table_result = find('body > form > table > tbody > tr:nth-child(1) > td > div > center > table')
  sales_tax = -0.01
  grand_total = 0
  sales_tax_rate = 0.05
  shipping_handling = 5.00
  product_total = 0


  table.rows.each do |row|
    qty = row[0]         
    item_name = row[1] 
    delivery_status = row[2]
    unit_price = row[3]

    unit_price_value = clean_numeric_value(unit_price)
  
    calculated_product_total = (unit_price_value * qty.to_i).round(2)
    calculated_sales_tax_value = (calculated_product_total * sales_tax_rate).round(2)

    product_total += calculated_product_total
    sales_tax += calculated_sales_tax_value

    expect(table_result.text).to have_content(delivery_status)    
    expect(table_result.text).to have_content(item_name)
    expect(table_result.text).to have_content(delivery_status)
    expect(table_result.text).to have_content(unit_price)
  end
  
  calculated_grand_total_value = (product_total + sales_tax + shipping_handling).round(2)

  expect(table_result.text).to have_content(format_currency(product_total))
  expect(table_result.text).to have_content(format_currency(sales_tax))
  expect(table_result.text).to have_content(format_currency(calculated_grand_total_value))
end