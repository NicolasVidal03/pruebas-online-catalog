Before do
  @catalog_page = CatalogPage.new
  @order_confirmation_page = OrderConfirmationPage.new
end

#And I should see the following order details:
Then('I should see the following order details:') do | table |
  @order_confirmation_page.verify_order_details(table)
end

#And I should see more information about the order:
Then('I should see more information about the order:') do | table |
  @order_confirmation_page.verify_additional_info(table)
  end