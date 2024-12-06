Feature: Placing an Order with a Single Item
  As a user
  I want to place an order with a single item
  So that I can verify the details of my order

  Background:
    Given I am on the GMO homepage
    And I click on the "Enter GMO OnLine" button
    And I am on the GMO home


  Scenario Outline: Placing an Order with a Single Item
    When I add <Qty> item of "<Item Name>" to the order
    And I click on the "Place An Order" button
    Then I should see the following order details for the only item:
    | Qty   | Product Description | Delivery Status   | Unit Price | Shipping & Handling | 
    | <Qty> | <Item Name>         | <Delivery Status> | <Price>    | $ 5.00              |

    Examples:
    | Qty | Item Name               | Delivery Status | Price    | 
    | 1   | 3 Person Dome Tent      | To Be Shipped   | $ 299.99 | 
    | 1   | External Frame Backpack | To Be Shipped   | $ 179.95 | 
    | 1   | Glacier Sun Glasses     | To Be Shipped   | $ 67.99  | 
    | 1   | Padded Socks            | To Be Shipped   | $ 19.99  | 
    | 1   | Hiking Boots            | To Be Shipped   | $ 109.90 | 
    | 1   | Back Country Shorts     | To Be Shipped   | $ 24.95  | 


  Scenario: Placing an Order with Invalid Quantity
    When I enter "abc" in the Order Quantity field for 3 Person Dome Tent
    And I click on the "Place An Order" button
    Then I see a confirmation dialog with the message "Please enter only digits in this field."
    And I click the "Aceptar" button in the confirmation dialog
    And I see the follow table:
    | Item Number | Item name               | Unit Price | Order Quantity |
    | 1000        | 3 Person Dome Tent      | $ 299.99   | 0              |
    | 1001        | External Frame Backpack | $ 179.95   | 0              |
    | 1002        | Glacier Sun Glasses     | $ 67.99    | 0              |
    | 1003        | Padded Socks            | $ 19.99    | 0              |
    | 1004        | Hiking Boots            | $ 109.90   | 0              |
    | 1005        | Back Country Shorts     | $ 24.95    | 0              |


Scenario: Placing an Order with all Items
  When I add all items of the catalog
    | Qty | Item Name               | 
    | 1   | 3 Person Dome Tent      | 
    | 1   | External Frame Backpack | 
    | 1   | Glacier Sun Glasses     | 
    | 1   | Padded Socks            | 
    | 1   | Hiking Boots            | 
    | 1   | Back Country Shorts     | 
  And I click on the "Place An Order" button
  And I should see:
    | Qty | Item Name               | Delivery Status | Unit Price |
    | 1   | 3 Person Dome Tent      | To Be Shipped   | $ 299.99   |
    | 1   | External Frame Backpack | To Be Shipped   | $ 179.95   |
    | 1   | Glacier Sun Glasses     | To Be Shipped   | $ 67.99    |
    | 1   | Padded Socks            | To Be Shipped   | $ 19.99    | 
    | 1   | Hiking Boots            | To Be Shipped   | $ 109.90   |
    | 1   | Back Country Shorts     | To Be Shipped   | $ 24.95    | 

Scenario: Put an Order of one item with 0 quantity
    When I add the order:
      | Quantity | Item               | 
      | 0        | 3 Person Dome Tent |
    And I click on the "Place An Order" button
    Then I should see an alert "Please Order Something First"