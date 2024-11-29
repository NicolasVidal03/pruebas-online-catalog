# When I click on the Enter GMO OnLine button
When(/^I click on the "([^"]*)" button$/) do |button_name|
    click_button(button_name)
end  

# And I click on the xxxx product link
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
  