Feature: Placing an Order with a Single Item
  As a user
  I want to place an order with a single item
  So that I can verify the details of my order

  Background:
    Given I am on the GMO homepage
    And I click on the "Enter GMO OnLine" button

  Scenario Outline: Placing an Order with a Single Item
    When I add <Qty> item of "<Item Name>" to the order
    And I click on the "Place An Order" button
    Then I should see the details for the following fields: Quantity (Qty), Product Description, Delivery Status, Unit Price, and Total Price:
    | Qty   | Product Description | Delivery Status   | Unit Price | Total Price |
    | <Qty> | <Item Name>         | <Delivery Status> | <Price>    | <Price>     |
    And I should see the details for the following fields: Product Total, Sales Tax, Shipping & Handling, Grand Total:
    | Product Total | Sales Tax  | Shipping & Handling | Grand Total  |       
    | <Price>       | <SalesTax> | $ 5.00              | <GrandTotal> |

    Examples:
    | Qty | Item Name              | Delivery Status | Price    | SalesTax  | GrandTotal  |
    | 1   | 3 Person Dome Tent     | To Be Shipped   | $ 299.99 | $ 15.00   | $ 319.99    |
    | 1   | External Frame Backpack| To Be Shipped   | $ 179.95 | $ 9.00    | $ 193.95    |
    | 1   | Glacier Sun Glasses    | To Be Shipped   | $ 67.99  | $ 3.40    | $ 76.39     |
    | 1   | Padded Socks           | To Be Shipped   | $ 19.99  | $ 1.00    | $ 25.99     |
    | 1   | Hiking Boots           | To Be Shipped   | $ 109.90 | $ 5.50    | $ 120.40    |
    | 1   | Back Country Shorts    | To Be Shipped   | $ 24.95  | $ 1.25    | $ 31.20     | 


  Scenario: Placing an Order with Invalid Quantity
    When I enter "abc" in the Order Quantity field for 3 Person Dome Tent
    And I click on the "Place An Order" button
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


Scenario: Placing an Order with all Items
  When I add the following items to the order with their respective quantities:
    | Item                    | Quantity |
    | 3 Person Dome Tent      | 1        |
    | External Frame Backpack | 1        |
    | Glacier Sun Glasses     | 1        |
    | Padded Socks            | 1        |
    | Hiking Boots            | 1        |
    | Back Country Shorts     | 1        |
  And I click on the "Place An Order" button
  Then I should see the title "Place Order"
  And I should see the following items with details about quantity, product description, delivery status, unit price, and total price:
    | Qty | Product Description     | Delivery Status | Unit Price | Total Price |
    | 1 | 3 Person Dome Tent      | To Be Shipped   | $ 299.99     | $ 299.99    |
    | 1 | External Frame Backpack | To Be Shipped   | $ 179.95     | $ 179.95    |
    | 1 | Glacier Sun Glasses     | To Be Shipped   | $ 67.99      | $ 67.99     |
    | 1 | Padded Socks            | To Be Shipped   | $ 19.99      | $ 19.99     |
    | 1 | Hiking Boots            | To Be Shipped   | $ 109.90     | $ 109.90    |
    | 1 | Back Country Shorts     | To Be Shipped   | $ 24.95      | $ 24.95     |
  And I should see additional information about the order, including product total, sales tax, shipping & handling, and grand total:
    | Product Total             | $ 702.77 |
    | Sales Tax                 | $ 35.14  |
    | Shipping & Handling       | $ 5.00   |
    | Grand Total               | $ 742.91 |

Scenario: Put an Order of one item with 0 quantity
    When I add the following items to the order with their respective quantities:
      | Quantity | Item               | 
      | 0        | 3 Person Dome Tent |
    And I click on the "Place An Order" button
    Then I should see an alert "Please Order Something First"