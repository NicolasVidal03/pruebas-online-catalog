Before do
  @billing_page = BillingPage.new
  @order_receipt_page=OrderReceiptPage.new
end

# Then I should see the billing form
Then(/^I should see the billing form$/) do
  @billing_page.verify_billing_form
end
  
# When I fill in the billing information
When(/^I fill in the billing information:$/) do |table|
  billing_data = table.hashes.map { |row| [row['Field'], row['Value']] }.to_h
  @billing_page.fill_billing_information(billing_data)
end

# And I fill in the shipping information
And(/^I fill in the shipping information:$/) do |table|
  shipping_data = table.hashes.map { |row| [row['Field'], row['Value']] }.to_h
  @billing_page.fill_shipping_information(shipping_data)
end

# Then I should see the order receipt with Product Total, Sales Tax, Shipping & Handling and Grand Total
Then(/^I should see the order receipt with Product Total "([^"]*)", Sales Tax "([^"]*)", Shipping & Handling "([^"]*)" and Grand Total "([^"]*)"$/) do |product_total, sales_tax, shipping_handling, grand_total|
  @order_receipt_page.verify_order_receipt(
    product_total: product_total,
    sales_tax: sales_tax,
    shipping_handling: shipping_handling,
    grand_total: grand_total
  )
end

# And I click on the "Same as 'Bill To'" checkbox
And(/^I click on the "Same as 'Bill To'" checkbox$/) do
  @billing_page.click_same_as_bill_to
end
  
# Then the shipping information should be automatically filled with the following:
Then(/^the shipping information should be automatically filled with the following:$/) do |table|
  expected_data = table.hashes.map { |row| [row['Field'], row['Value']] }.to_h
  @billing_page.verify_shipping_information_autofilled(expected_data)
end