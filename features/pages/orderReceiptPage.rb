class OrderReceiptPage
    include Capybara::DSL
    include RSpec::Matchers

    def verify_order_receipt(product_total:, sales_tax:, shipping_handling:, grand_total:)
        expect(page).to have_content("Product Total $ #{product_total}")
        expect(page).to have_content("Sales Tax $ #{sales_tax}")
        expect(page).to have_content("Shipping & Handling $ #{shipping_handling}")
        expect(page).to have_content("Grand Total $ #{grand_total}")
    end
end