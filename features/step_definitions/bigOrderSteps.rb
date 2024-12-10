Before do
  @catalog_page = CatalogPage.new
  @order_confirmation_page = OrderConfirmationPage.new
end

# Then I should see the following items with details about quantity, product description, delivery status, unit price, and total price:
Then('I should see the following items with details about quantity, product description, delivery status, unit price, and total price:') do | table |
  @order_confirmation_page.verify_order_details(table)
end

#And I should see additional information about the order, including product total, sales tax, shipping & handling, and grand total:
Then('I should see additional information about the order, including product total, sales tax, shipping & handling, and grand total:') do | table |
  @order_confirmation_page.verify_additional_info(table)
end