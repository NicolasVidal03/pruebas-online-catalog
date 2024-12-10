class HomePage
    include Capybara::DSL
    include RSpec::Matchers
  
    def visit_homepage
      visit 'https://demo.borland.com/gmopost/'
    end

    def verify_buttons(table)
      table.raw.each do |row|
        value = row[0]
        expect(page).to have_selector("input[value='#{value}']"),
          "Expected to find button with visible text '#{value}', but it was not found"
      end
    end
end