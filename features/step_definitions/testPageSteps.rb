Before do
  @sample_page = SamplePage.new
end

# Then the table should have headers:
Then(/^the table should have headers:$/) do |table|
  expected_headers = table.raw.flatten
  actual_headers = @sample_page.table_headers
  expect(actual_headers).to match_array(expected_headers)
end

# Then the "Internet Explorer 3.0 or Netscape Navigator 3.0" column should display the following content:
Then(/^the "([^"]*)" column should display the following content:$/) do |column_number, table|
  expected_content = table.raw.flatten
  actual_content = @sample_page.column_content(column_number)
  expect(actual_content).to include(*expected_content)
end

# When I click the "ActiveX or java" image
When(/^I click the "([^"]*)" image$/) do |type|
  @sample_page.click_image(type)
end

# Then I should see the message "Sample Java Applet"
Then(/^I should see the message "([^"]*)"$/) do |message|
  expect(@sample_page.applet_message(message)).to be true
end

# Then I should see the ActiveX table:
Then(/^I should see the ActiveX table:$/) do |table|
  data = table.rows_hash
  @sample_page.active_x_table(data)
end

# When I click the GMO image
When(/^I click the GMO image$/) do
  @sample_page.click_gmo_image
end
