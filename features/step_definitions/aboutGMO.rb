#Given I am on the GMO page
Given('I am on the GMO page') do
    page.driver.browser.manage.window.maximize
    visit ('https://demo.borland.com/gmopost')
  end

#When I click in "About The GMO Site"
When('I click in {string}') do |nameButton|
    click_button(nameButton)
  end

#Then I should see the title "About This Site"
Then('I should see the title {string}') do |title|
    expect(page).to have_selector('h1', text: title)
  end

#And I should see the image "images/gmo-animate.gif"
Then("I should see the image {}") do |image|
    expect(page).to have_xpath("/html/body/table/tbody/tr/td[2]/h3/img")
  end
  

#And I should see the following table with technologies:
Then("I should see the following table with technologies:") do |expected_table|
    column1 = find(:xpath, '/html/body/div/center/table/tbody/tr[2]/td[1]')
    column2 = find(:xpath, '/html/body/div/center/table/tbody/tr[2]/td[2]')
    
    column1_items = column1.all('li').map(&:text)
    column2_items = column2.all('li').map(&:text)
  
    expected_data = expected_table.raw
    expected_column1 = expected_data.map { |row| row[0] }.compact.reject(&:empty?)
    expected_column2 = expected_data.map { |row| row[1] }.compact.reject(&:empty?)
  
    expect(column1_items).to match_array(expected_column1)
    expect(column2_items).to match_array(expected_column2)
  end
  