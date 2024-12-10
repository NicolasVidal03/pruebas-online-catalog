Feature: Catalog Verification
  As a user
  I want to verify that the catalog displays the correct items
  So that I can ensure all items are shown with accurate details and actions

Background:
  Given I am on the GMO homepage
  When I click on the "Enter GMO OnLine" button
  And I am on the GMO home

Scenario: Verify the catalog displays each item's number, name, unit price, and order quantity
  Given I see the title "OnLine Catalog"
  And I see the text: These are the items currently available through our online catalog. Select the quantity of each item and then press the "Place An Order" button at the bottom of the page.
  Then I should see the following items along with their unit price and order quantity:
    | Item Number | Item Name                 | Unit Price | Order Quantity |
    | 1000        | 3 Person Dome Tent        | $ 299.99   | 0              |
    | 1001        | External Frame Backpack   | $ 179.95   | 0              |
    | 1002        | Glacier Sun Glasses       | $ 67.99    | 0              |
    | 1003        | Padded Socks              | $ 19.99    | 0              |
    | 1004        | Hiking Boots              | $ 109.90   | 0              |
    | 1005        | Back Country Shorts       | $ 24.95    | 0              |

Scenario: Ensure the "Reset Form" button is visible
  Given I look for the "Reset Form" button
  Then the "Reset Form" button should be visible

Scenario: Ensure the "Place An Order" button is visible
  Given I look for the "Place An Order" button
  Then the "Place An Order" button should be visible

