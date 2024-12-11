class CatalogPage
    include Capybara::DSL
    include RSpec::Matchers

    TITLE_SELECTOR = 'body > table > tbody > tr > td:nth-child(1) > h1'
    ITEM_TABLE_ROW_SELECTOR = 'body > form > table > tbody > tr:nth-child(2) > td > div > center > table > tbody > tr'
    BUTTON_SELECTOR_TEMPLATE = "[value='%{button_name}']"

    def add_product_to_order(quantity, product_name)
      product_selector = "body > form > table > tbody > tr:nth-child(2) > td > div > center > table > tbody > tr > td:nth-child(2) > a > strong"
      all_product_names = all(product_selector).map(&:text)
      index = all_product_names.index(product_name) 
      input_selector = "body > form > table > tbody > tr:nth-child(2) > td > div > center > table > tbody > tr:nth-child(#{index + 2}) > td:nth-child(4) > h1 > input[type=text]"
      find(input_selector).set(quantity)
    end

    def click_product_link(product_name)
      click_link(product_name)
    end

    def verify_product_table(expected_table)
      actual_table = find('body > form > table > tbody > tr:nth-child(2) > td > div > center > table') 
      rows = actual_table.all('tr')
  
      expected_table.hashes.each_with_index do |expected_row, index|
        row = rows[index + 1]
        columns = row.all('td').map(&:text)
        expect(columns).to eq(expected_row.values)
      end
    end


    def verify_order_quantities_reset_to_zero
      all(:xpath, "//input[@type='text']").each do |field|
        expect(field.value).to eq("0")
      end
    end
    
    def verify_order_quantity_for_product(item_name, expected_value)
      product_name_css = "body > form > table > tbody > tr:nth-child(2) > td > div > center > table > tbody > tr > td:nth-child(2)"
      product_names = all(product_name_css).map(&:text)
  
      index = product_names.index(item_name)
      raise "Item not found: #{item_name}" if index.nil?
  
      quantity_input_selector = "body > form > table > tbody > tr:nth-child(2) > td > div > center > table > tbody > tr:nth-child(#{index + 1}) > td:nth-child(4) > h1 > input[type='text']"
      actual_value = find(quantity_input_selector).value
      expect(actual_value).to eq(expected_value)
    end

    def title_visible?(expected_title)
      find(TITLE_SELECTOR).text.strip == expected_title
    end
  
    def text_visible?(text)
      page.has_content?(text)
    end
  
    def verify_catalog_items(expected_items)
      expected_items.each_with_index do |item, index|
        item_number_selector = "#{ITEM_TABLE_ROW_SELECTOR}:nth-child(#{index + 2}) > td:nth-child(1)"
        item_name_selector = "#{ITEM_TABLE_ROW_SELECTOR}:nth-child(#{index + 2}) > td:nth-child(2) > a > strong"
        unit_price_selector = "#{ITEM_TABLE_ROW_SELECTOR}:nth-child(#{index + 2}) > td:nth-child(3)"
        order_quantity_selector = "#{ITEM_TABLE_ROW_SELECTOR}:nth-child(#{index + 2}) > td:nth-child(4) > h1 > input[type='text']"
  
        expect(find(item_number_selector).text.strip).to eq(item['Item Number'])
        expect(find(item_name_selector).text.strip).to eq(item['Item Name'])
        expect(find(unit_price_selector).text.strip).to eq(item['Unit Price'])
        expect(find(order_quantity_selector).value).to eq(item['Order Quantity'])
      end
    end
  
    def find_button_by_name(name)
      find(BUTTON_SELECTOR_TEMPLATE % { button_name: name })
    end
  
    def button_visible?(name)
      has_selector?(BUTTON_SELECTOR_TEMPLATE % { button_name: name })
    end
end