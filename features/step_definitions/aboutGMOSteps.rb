Before do
  @about_page = AboutPage.new
end

#And I should see the image "images/gmo-animate.gif"
Then("I should see the image {}") do |image|
  expect(@about_page.image_present?(image)).to be true
end
  
#And I should see the following table with technologies:
Then("I should see the following table with technologies:") do |expected_table|
  actual_column1, actual_column2 = @about_page.technologies_table

  expected_data = expected_table.raw
  expected_column1 = expected_data.map { |row| row[0] }.compact.reject(&:empty?)
  expected_column2 = expected_data.map { |row| row[1] }.compact.reject(&:empty?)

  expect(actual_column1).to match_array(expected_column1)
  expect(actual_column2).to match_array(expected_column2)
end  