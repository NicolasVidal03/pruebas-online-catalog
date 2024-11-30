#When I click the button "Browser Test Page"
When('I click the button {string}') do |nameButton|
    click_button(nameButton)
  end

#Then I should see the title "All Browsers Are Not Created Equal"
Then('I should see the next title {string}') do |title|
    expect(page).to have_selector('body > h1 > font', text: title)
  end

#And the table should have headers:
Then(/^the table should have headers:$/) do |table|
    expected_headers = table.raw.flatten
    actual_headers = all('body > div > center > table > tbody > tr > td:nth-child(2) > table > tbody > tr:nth-child(1) > td').map(&:text)
    expect(actual_headers).to match_array(expected_headers)
  end

#And the {first, second} column should contain:
Then(/^the "([^"]*)" column should contain:$/) do |columnNumber, table|
  number = columnNumber == 'first' ? 1 : 2
  expected_content = table.raw.flatten

  td_xpath = "/html/body/div/center/table/tbody/tr/td[2]/table/tbody/tr[2]/td[#{number}]"

  td = find(:xpath, td_xpath)

  actual_content = td.all('p, ul').map(&:text).map(&:strip).map { |value| value.strip.gsub("\n", " ").strip }

  expect(actual_content).to include(*expected_content)
end


#And I click the "java" image
When('I click the {string} image') do | type |
    number = type == 'java' ? 3 : 4
    find("body > div > center > table > tbody > tr > td:nth-child(1) > p:nth-child(#{number}) > a > img").click
  end
  
#Then I should see the message "Sample Java Applet"
Then('I should see the message {string}') do | message |
    expect(page).to have_selector('#testApplet', text: message)
  end

#Then I should see the ActiveX table:
Then('I should see the ActiveX table:') do | table |
    data = table.rows_hash
    counter = 1
    path = find('body > div > center > table')
    xpath_base_name = './tbody/tr'
    data.each_pair do |key, value|
        expect(path.find(:xpath, "./tbody/tr[#{counter}]")).to have_content(key)
        counter += 1 
    end
  end
  

#Then the page shows an alert
Then('the page shows an alert') do
    alert = page.driver.browser.switch_to.alert
    alert_expect = 'This button AND the GMO image should be on the right edge of the page!' 
    expect(alert_expect).to include(alert.text)
  end


#When I click the GMO image
When('I click the GMO image') do
    find('body > form:nth-child(5) > p > input[type=image]').click
  end
  
  

  
  