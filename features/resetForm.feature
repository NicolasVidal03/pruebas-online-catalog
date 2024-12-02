Feature: As a user of the GMO Post demo page
         I want to reset the form
         so I can clear all the fields easily
         
Background:
  Given I am on the GMO homepage
  When I click on the "Enter GMO OnLine" button

@maximize
Scenario: Clear a single field when clicking Reset Form
  When I fill the "Order quantity" field for "3 Person Dome Tent" with "2"
  And I click the "Reset Form" button
  Then the "Order quantity" field for "3 Person Dome Tent" should be reset to "0"

@maximize
Scenario: Reset the order quantity for all items
  Given I fill the "Order quantity" fields as shown below:
    | Item Name                | Order Quantity |
    | 3 Person Dome Tent       | 1              |
    | External Frame Backpack  | 2              |
    | Glacier Sun Glasses      | 3              |
    | Padded Socks             | 4              |
    | Hiking Boots             | 5              |
    | Back Country Shorts      | 6              |
  When I click the "Reset Form" button for delete all items
  Then all "Order quantity" fields should be reset to "0"

Scenario: Reset the order quantity with invalid input
  When I fill the "Order quantity" field for "3 Person Dome Tent" with "hola"
  And I click the "Reset Form" button
  And I see a confirmation dialog with the message "Please enter only digits in this field."
  And I click the "Aceptar" button in the confirmation dialog
  Then the "Order quantity" field for "3 Person Dome Tent" should be reset to "0"
