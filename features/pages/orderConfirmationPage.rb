class OrderConfirmationPage
    include Capybara::DSL
    include RSpec::Matchers
    SELECTORS_TABLE = {
        product_total: 'body > form > table > tbody > tr:nth-child(1) > td > div > center > table > tbody > tr:nth-child(3) > td:nth-child(3)',
        sales_tax: 'body > form > table > tbody > tr:nth-child(1) > td > div > center > table > tbody > tr:nth-child(4) > td:nth-child(2)',
        shipping_handling: 'body > form > table > tbody > tr:nth-child(1) > td > div > center > table > tbody > tr:nth-child(5) > td:nth-child(2)',
        grand_total: 'body > form > table > tbody > tr:nth-child(1) > td > div > center > table > tbody > tr:nth-child(6) > td:nth-child(2) > strong',
    }
  
    def verify_order_details(table)
        order_details = page.find('body > form > table > tbody > tr:nth-child(1) > td > div > center > table > tbody')
  
        table.hashes.each_with_index do | row, index |
            qty = row['Qty']
            description = row['Product Description']
            delivery = row['Delivery Status']
            unit_price = row['Unit Price']
            total_price = row['Total Price']

        row_index = index + 2
        order_row = order_details.find("tr:nth-child(#{row_index})")

        expect(order_row.find('td:nth-child(1)').text).to eq(qty)
        expect(order_row.find('td:nth-child(2)').text).to eq(description)
        expect(order_row.find('td:nth-child(3)').text).to eq(delivery)
        expect(order_row.find('td:nth-child(4)').text).to eq(unit_price)
        expect(order_row.find('td:nth-child(5)').text).to eq(total_price)
    end

    def verify_additional_info(table)
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

    def verify_totals(expected_totals)
        product_total_page = find(SELECTORS_TABLE[:product_total]).text.strip
        sales_tax_page = find(SELECTORS_TABLE[:sales_tax]).text.strip
        shipping_handling_page = find(SELECTORS_TABLE[:shipping_handling]).text.strip
        grand_total_page = find(SELECTORS_TABLE[:grand_total]).text.strip
        
        expected_totals.hashes.each do |row|
          expect(product_total_page).to eq(row['Product Total'])
          expect(sales_tax_page).to eq(row['Sales Tax'])
          expect(shipping_handling_page).to eq(row['Shipping & Handling'])
          expect(grand_total_page).to eq(row['Grand Total'])
        end
        
    end
    
end
end