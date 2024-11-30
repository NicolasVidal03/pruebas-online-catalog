# Given I am on the GMO homepage
Given(/^I am on the GMO homepage$/) do
    visit('https://demo.borland.com/gmopost/')
end
  
# Then I should see the following buttons
Then(/^I should see the following buttons:$/) do |table|
    table.raw.each do |row|
      value = row[0] 
  
      expect(page).to have_selector("input[value='#{value}']"),
        "Expected to find button with visible text '#{value}', but it was not found"
    end
end