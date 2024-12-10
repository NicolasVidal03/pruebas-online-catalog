Before do
  @catalog_page = CatalogPage.new
end

# Then all "Order quantity" fields should be reset to "0"
Then(/^all "Order quantity" fields should be reset to "0"$/) do
  @catalog_page.verify_order_quantities_reset_to_zero

end  
  
# Then the "Order quantity" field for "3 Person Dome Tent" should be reset to "0"
Then(/^the "Order quantity" field for "([^"]+)" should be reset to "([^"]+)"$/) do |item_name, expected_value|
  @catalog_page.verify_order_quantity_for_product(item_name, expected_value)
end