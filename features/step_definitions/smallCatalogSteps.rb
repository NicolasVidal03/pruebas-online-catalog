# Paso general para verificar que estamos en el homepage de GMO

# Given I am on the welcome page of GMO OnLine
Given(/^I am on the welcome page of GMO OnLine$/) do
    page.driver.browser.manage.window.maximize
    visit('https://demo.borland.com/gmopost/')
  end
  
  # When I click on the button "Enter GMO OnLine"
  When(/^I click on the button "([^"]*)"$/) do |button_text|
    click_button(button_text)
  end
  
  # And I am on the GMO homep
  And(/^I am on the GMO home$/) do
    expect(page).to have_content("OnLine Catalog")
  end
  
  
  # Paso especifico para verificar que se muestra el catalogo corto
  
  # Given I see the title "OnLine Catalog"
  Given(/^I see the title "([^"]*)"$/) do |expected_title|
    expect(page).to have_content(expected_title)
  end
  
  And(/^I see the text: (.*)$/) do |text_info|
    expect(page).to have_content(text_info)
  end
  
  Then(/^I should see the following items:$/) do |table|
    table.hashes.each_with_index do |row, index|
      # Verificar cada fila de la tabla
      item_number_selector = " body > form > table > tbody > tr:nth-child(2) > td > div > center > table > tbody > tr:nth-child(#{index + 2}) > td:nth-child(1)"
      item_name_selector = " body > form > table > tbody > tr:nth-child(2) > td > div > center > table > tbody > tr:nth-child(#{index + 2}) > td:nth-child(2) > a > strong"
      unit_price_selector = " body > form > table > tbody > tr:nth-child(2) > td > div > center > table > tbody > tr:nth-child(#{index + 2}) > td:nth-child(3)"
      order_quantity_selector = "body > form > table > tbody > tr:nth-child(2) > td > div > center > table > tbody > tr:nth-child(#{index + 2}) > td:nth-child(4) > h1 > input[type='text']"
  
      # Validar cada columna
      expect(find(item_number_selector).text.strip).to eq(row['Item Number'])
      expect(find(item_name_selector).text.strip).to eq(row['Item Name'])
      expect(find(unit_price_selector).text.strip).to eq(row['Unit Price'])
      expect(find(order_quantity_selector).value).to eq(row['Order Quantity'])
    end
  end
  
  
  # Paso especifico para verificar que se muestra los botonoes correctamente
  
  # Given I look for the "Reset Form" or "Place An Order" button
  Given(/^I look for the "([^"]*)" button$/) do |name_button|
    @button = find_button(name_button) # Este paso asume que el botón tiene el texto 'Reset Form'
  end
  
  # Then the "Reset Form" or "Place An Order" button should be visible
  Then(/^the "([^"]*)" button should be visible$/) do |name_button|
    expect(@button).to be_visible 
  end
  
  
    