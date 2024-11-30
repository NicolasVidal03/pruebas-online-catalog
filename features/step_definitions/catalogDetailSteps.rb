# And I click on the "<Product Name>"  product link
And(/^I click on the "([^"]*)" product link$/) do |product_name|
    click_link(product_name)  
end
  
# Then I  should see the following details
Then(/^I should see the following details:$/) do |table|
    table.raw.each do |row|
      detail_value = row[1]
      expect(page).to have_content(detail_value)
    end
end
  