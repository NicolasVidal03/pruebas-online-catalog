Before do
  @catalog_page = CatalogPage.new
  @order_confirmation_page = OrderConfirmationPage.new
end

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

# Then I should see the details for the following fields: Quantity (Qty), Product Description, Delivery Status, Unit Price, and Total Price:
Then('I should see the details for the following fields: Quantity \(Qty), Product Description, Delivery Status, Unit Price, and Total Price:') do |table|
  @order_confirmation_page.verify_order_details(table)
end


# And I should see the details for the following fields: Product Total, Sales Tax, Shipping & Handling, Grand Total:
And('I should see the details for the following fields: Product Total, Sales Tax, Shipping & Handling, Grand Total:') do |table|

    product_total_page = get_page_text(selectors_table_Place_order[:product_total])
    sales_tax_page = get_page_text(selectors_table_Place_order[:sales_tax])
    shipping_handling_page = get_page_text(selectors_table_Place_order[:shipping_handling])
    grand_total_page = get_page_text(selectors_table_Place_order[:grand_total])

    row = table.hashes.first
    product_total_table = row['Product Total']
    sales_tax_table = row['Sales Tax']
    shipping_handling_table = row['Shipping & Handling']
    grand_total_table = row['Grand Total']

    expect(product_total_page).to have_content(product_total_table)
    expect(sales_tax_page).to have_content(sales_tax_table)
    expect(shipping_handling_page).to have_content(shipping_handling_table)
    expect(grand_total_page).to have_content(grand_total_table)
end

# And I see the following table displaying the items, their unit prices, and their order quantities:
And('I see the following table displaying the items, their unit prices, and their order quantities:') do |expected_table|
  @catalog_page.verify_product_table(expected_table)
end

# When I add <Qty> quantities of all the items <Item Name>
When('I add {int} quantities of all the items {string}') do |qty, item_name|
    product_name_css = selectors_table_Place_order[:product_names]
    product_names = all(product_name_css).map(&:text)
    index = product_names.index(item_name)

    quantity_input_selector = "body > form > table > tbody > tr:nth-child(2) > td > div > center > table > tbody > tr:nth-child(#{index + 1}) > td:nth-child(4) > h1 > input[type=text]"
    find(quantity_input_selector).set(qty)
end

# When I add all items of the catalog
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