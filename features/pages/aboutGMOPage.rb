class AboutPage
    include Capybara::DSL
  
    def initialize
      @image_xpath = "/html/body/table/tbody/tr/td[2]/h3/img"
      @column1_xpath = '/html/body/div/center/table/tbody/tr[2]/td[1]'
      @column2_xpath = '/html/body/div/center/table/tbody/tr[2]/td[2]'
    end
  
    def image_present?(image)
        if page.has_xpath?(@image_xpath, visible: true)
            img_element = page.find(:xpath, @image_xpath)
            image = image.gsub('"', '')
            img_element['src'].include?(image)
        else
            false
        end
    end
  
    def table_matches_technologies?(expected_table)
        column1_items = find(:xpath, @column1_xpath).all('li').map(&:text)
        column2_items = find(:xpath, @column2_xpath).all('li').map(&:text)
    
        expected_data = expected_table.raw
        expected_column1 = expected_data.map { |row| row[0] }.compact.reject(&:empty?)
        expected_column2 = expected_data.map { |row| row[1] }.compact.reject(&:empty?)
    
        column1_matches = column1_items.sort == expected_column1.sort
        column2_matches = column2_items.sort == expected_column2.sort
    
        column1_matches && column2_matches
    end
end