class SamplePage
    include Capybara::DSL
  
    def table_headers
      all('body > div > center > table > tbody > tr > td:nth-child(2) > table > tbody > tr:nth-child(1) > td').map(&:text)
    end
  
    def column_content(column_name)
      number = column_name == 'Internet Explorer 3.0' ? 1 : 2
      td_xpath = "/html/body/div/center/table/tbody/tr/td[2]/table/tbody/tr[2]/td[#{number}]"
      find(:xpath, td_xpath).all('p, ul').map(&:text).map(&:strip).map { |value| value.strip.gsub("\n", " ").strip }
    end
  
    def click_image(type)
      number = type == 'java' ? 3 : 4
      find("body > div > center > table > tbody > tr > td:nth-child(1) > p:nth-child(#{number}) > a > img").click
    end

    def applet_message(message)
      has_selector?('#testApplet', text: message)
    end

    def active_x_table(data)
        counter = 1
        path = find('body > div > center > table')
        xpath_base_name = './tbody/tr'
        rows = []
    
        data.each_pair do |key, value|
          row_text = path.find(:xpath, "./tbody/tr[#{counter}]").text.strip
          rows << row_text
          counter += 1
        end
    
        rows.each_with_index do |row, index|
          expected_content = data.to_a[index][0]
          raise "Expected '#{expected_content}' to be in '#{row}'" unless row.include?(expected_content)
        end
    end
  
    def click_gmo_image
      find('body > form:nth-child(5) > p > input[type=image]').click
    end
  end
  