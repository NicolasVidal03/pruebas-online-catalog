class CatalogPage
    include Capybara::DSL
  
    def add_product_to_order(quantity, product_name)
      product_selector = "body > form > table > tbody > tr:nth-child(2) > td > div > center > table > tbody > tr > td:nth-child(2) > a > strong"
      all_product_names = all(product_selector).map(&:text)
      index = all_product_names.index(product_name) 
      input_selector = "body > form > table > tbody > tr:nth-child(2) > td > div > center > table > tbody > tr:nth-child(#{index + 2}) > td:nth-child(4) > h1 > input[type=text]"
      find(input_selector).set(quantity)
    end
end