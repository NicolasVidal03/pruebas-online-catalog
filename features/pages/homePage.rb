class HomePage
    include Capybara::DSL
  
    def visit_homepage
      visit 'https://demo.borland.com/gmopost/'
    end
end