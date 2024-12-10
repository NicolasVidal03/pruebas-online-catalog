class BillingPage
    include Capybara::DSL
    include RSpec::Matchers
  
    def verify_billing_form
      expected_bill_inputs = ["billName", "billAddress", "billCity", "billState", "billZipCode", "billPhone", "billEmail", "CardNumber", "CardDate", "shipName", "shipAddress", "shipCity", "shipState", "shipZipCode", "shipPhone"]
      bill_inputs = all("input")
  
      expected_bill_inputs.each do |name|
        input = bill_inputs.find { |input| input[:name] == name }
        expect(input).to be_visible
      end
    end
  
    def fill_billing_information(billing_data)
      billing_data.each do |field, value|
        case field
        when 'Name'
          find('[name="billName"]').set(value)
        when 'Address'
          find('[name="billAddress"]').set(value)
        when 'City'
          find('[name="billCity"]').set(value)
        when 'State'
          find('[name="billState"]').set(value)
        when 'Zip'
          find('[name="billZipCode"]').set(value)
        when 'Phone'
          find('[name="billPhone"]').set(value)
        when 'E-mail'
          find('[name="billEmail"]').set(value)
        when 'Credit Card'
          find('[name="CardType"]').select(value)
        when 'Card Number'
          find('[name="CardNumber"]').set(value)
        when 'Expiration Date'
          find('[name="CardDate"]').set(value)
        end
      end
    end
  
    def fill_shipping_information(shipping_data)
      shipping_data.each do |field, value|
        case field
        when 'Name'
          find('[name="shipName"]').set(value)
        when 'Address'
          find('[name="shipAddress"]').set(value)
        when 'City'
          find('[name="shipCity"]').set(value)
        when 'State'
          find('[name="shipState"]').set(value)
        when 'Zip'
          find('[name="shipZipCode"]').set(value)
        when 'Phone'
          find('[name="shipPhone"]').set(value)
        end
      end
    end
  
    def verify_order_receipt(product_total:, sales_tax:, shipping_handling:, grand_total:)
      expect(page).to have_content("Product Total $ #{product_total}")
      expect(page).to have_content("Sales Tax $ #{sales_tax}")
      expect(page).to have_content("Shipping & Handling $ #{shipping_handling}")
      expect(page).to have_content("Grand Total $ #{grand_total}")
    end
  
    def click_same_as_bill_to
      find('input[name="shipSameAsBill"]').click
    end
  
    def verify_shipping_information_autofilled(expected_data)
      expected_data.each do |field, value|
        actual_value = find("[name='ship#{field}']").value
        expect(actual_value).to eq(value), "Expected #{field} to be '#{value}', but got '#{actual_value}'"
      end
    end
end
  