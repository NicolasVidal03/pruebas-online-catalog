Before do
  @catalog_page = CatalogPage.new
  @order_confirmation_page = OrderConfirmationPage.new
end
# Then I should see the details for the following fields: Quantity (Qty), Product Description, Delivery Status, Unit Price, and Total Price:
Then('I should see the details for the following fields: Quantity \(Qty), Product Description, Delivery Status, Unit Price, and Total Price:') do |table|
  @order_confirmation_page.verify_order_details(table)
end

# And I should see the details for the following fields: Product Total, Sales Tax, Shipping & Handling, Grand Total:
And('I should see the details for the following fields: Product Total, Sales Tax, Shipping & Handling, Grand Total:') do |table|
  @order_confirmation_page.verify_totals(table)
end

# And I see the following table displaying the items, their unit prices, and their order quantities:
And('I see the following table displaying the items, their unit prices, and their order quantities:') do |expected_table|
  @catalog_page.verify_product_table(expected_table)
end

# When I add <Qty> quantities of all the items <Item Name>
When('I add {int} quantities of all the items {string}') do |qty, item_name|
  @catalog_page.add_quantity_to_item(qty, item_name)
end

# When I add all items of the catalog
When('I add all items of the catalog') do |table|
  @catalog_page.add_all_items_to_cart(table)
end
