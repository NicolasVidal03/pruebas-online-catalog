class CatalogPageDetails
    include Capybara::DSL
    include RSpec::Matchers

    def verify_details(expected_details)
        expected_details.raw.each do |row|
          detail_value = row[1]
          expect(page).to have_content(detail_value)
        end
    end
end