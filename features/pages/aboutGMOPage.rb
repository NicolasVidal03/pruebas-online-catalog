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
  
    def technologies_table
      column1 = find(:xpath, @column1_xpath).all('li').map(&:text)
      column2 = find(:xpath, @column2_xpath).all('li').map(&:text)
      [column1, column2]
    end
  end
  