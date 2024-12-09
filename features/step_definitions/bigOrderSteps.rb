# When I add <Qty> item of "<Item Name>" to the order
When(/^I add (\d+) "([^"]*)" to the order$/) do |quantity, name|
    
    product_name_selector = "body > form > table > tbody > tr:nth-child(2) > td > div > center > table > tbody > tr > td:nth-child(2) > a > strong"
    all_product_names = all(product_name_selector).map(&:text)
    index = all_product_names.index(name)
  
    input = "body > form > table > tbody > tr:nth-child(2) > td > div > center > table > tbody > tr:nth-child(#{index + 2}) > td:nth-child(4) > h1 > input[type=text]"
    find(input).set(quantity)
  end

#And I should see the following order details:
Then('I should see the following order details:') do | table |
    order_details = page.find('body > form > table > tbody > tr:nth-child(1) > td > div > center > table > tbody')
  
    table.hashes.each_with_index do | row, index |
      qty = row['Qty'].to_i
      description = row['Product Description']
      delivery = row['Delivery Status']
      unit_price = row['Unit Price'].to_f
      expected_total_price = (qty * unit_price).round(2)
  
      row_index = index + 2
      order_row = order_details.find("tr:nth-child(#{row_index})")

      expect(order_row.find('td:nth-child(1)').text).to eq(qty.to_s)
      expect(order_row.find('td:nth-child(2)').text).to eq(description)
      expect(order_row.find('td:nth-child(3)').text).to eq(delivery)
      expect(order_row.find('td:nth-child(4)').text).to eq(format("$ %.2f", unit_price))
      expect(order_row.find('td:nth-child(5)').text).to eq(format("$ %.2f", expected_total_price))
    end
  end

#And I should see the Shipping & Handling, Sales Tax y Grand Total
Then('I should see the Shipping & Handling, Sales Tax y Grand Total') do | table |
    info_order = page.find('body > form > table > tbody > tr:nth-child(1) > td > div > center > table > tbody')

    table.rows.each do |row|
        info_label = row[0]
        info_value = row[1]
        info_row = info_order.find('tr', text: /\b#{info_label}\b/i)
        expect(info_row).to have_content(info_label)

        value_element = nil
        if info_label == 'Product Total'
            value_element = info_row.find('td:nth-child(3)')
        else
            value_element = info_row.find('td:nth-child(2)')
        end
        expect(value_element).to have_content(info_value)
    end
  end