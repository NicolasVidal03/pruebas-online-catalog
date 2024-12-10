Feature: As a user of the GMO Post demo page
         I want to reset the form
         so I can clear all the fields easily
         
Background:
  Given I am on the GMO homepage
  When I click on the "Enter GMO OnLine" button

Scenario: Clear a single field when clicking Reset Form
  When I fill the "Order quantity" field for "3 Person Dome Tent" with "2"
  And I click on the "Reset Form" button
  Then the "Order quantity" field for "3 Person Dome Tent" should be reset to "0"

Scenario: Reset the order quantity for all items
  Given I fill the "Order quantity" fields as shown below:
    | Item Name                | Order Quantity |
    | 3 Person Dome Tent       | 1              |
    | External Frame Backpack  | 2              |
    | Glacier Sun Glasses      | 3              |
    | Padded Socks             | 4              |
    | Hiking Boots             | 5              |
    | Back Country Shorts      | 6              |
  When I click on the "Reset Form" button
  Then all "Order quantity" fields should be reset to "0"
  
Scenario: Reset Form with Invalid Quantity
    When I enter "abc" in the Order Quantity field for 3 Person Dome Tent
    And I click on the "Reset Form" button
    Then I see a confirmation dialog with the message "Please enter only digits in this field."
    And I click the "Aceptar" button in the confirmation dialog
    And I see the following table displaying the items, their unit prices, and their order quantities:
    | Item Number | Item name               | Unit Price | Order Quantity |
    | 1000        | 3 Person Dome Tent      | $ 299.99   | 0              |
    | 1001        | External Frame Backpack | $ 179.95   | 0              |
    | 1002        | Glacier Sun Glasses     | $ 67.99    | 0              |
    | 1003        | Padded Socks            | $ 19.99    | 0              |
    | 1004        | Hiking Boots            | $ 109.90   | 0              |
    | 1005        | Back Country Shorts     | $ 24.95    | 0              |
