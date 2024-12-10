Before do
  @about_page = AboutPage.new
end

#And I should see the image "images/gmo-animate.gif"
Then("I should see the image {}") do |image|
  expect(@about_page.image_present?(image)).to be true
end
  
#And I should see the following table with technologies:
Then("I should see the following table with technologies:") do |expected_table|
  result = @about_page.table_matches_technologies?(expected_table)
  expect(result).to be true
end
  