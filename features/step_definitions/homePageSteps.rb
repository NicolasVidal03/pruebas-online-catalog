Before do
  @home_page = HomePage.new
end

# Then I should see the following buttons
Then(/^I should see the following buttons:$/) do |table|
  @home_page.verify_buttons(table)
end