Before do
  @catalog_page = CatalogPage.new
  @catalog_page_detailed = CatalogPageDetails.new

end
# And I click on the "<Product Name>"  product link
And(/^I click on the "([^"]*)" product link$/) do |product_name|
  @catalog_page.click_product_link(product_name)
end
  
# Then I  should see the following details
Then(/^I should see the following details:$/) do |table|
  @catalog_page_detailed.verify_details(table)
end
  