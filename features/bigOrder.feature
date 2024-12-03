Feature: OnLine Catalog with big orders
    As a user of GMO
    I want to do a big order with
    So I can verify the order details and the price

Background:
    Given I am on the GMO homepage
    When I click on the "Enter GMO OnLine" button

Scenario: Put an Order of one item with a big order quantity 
    When I add the order:
      | Quantity | Item               | 
      | 100      | 3 Person Dome Tent |
    And I click on the "Place An Order" button
    Then I should see the title "Place Order"
    And I should see the following order details:
      | Qty | Product Description | Delivery Status | Unit Price | Total Price |
      | 100 | 3 Person Dome Tent  | To Be Shipped   | $ 299.99   | $ $ 29999.00 |
    And I should see more information about the order:
      | Product Total             | $ 29999.00 |
      | Sales Tax                 | $ 1499.95  |
      | Shipping & Handling       | $ 5.00     |
      | Grand Total               | $ 31503.95 |


Scenario: Put an Order of three items, each with a big order quantity 
    When I add the order:
      | Item                    | Quantity |
      | External Frame Backpack | 100      |
      | Padded Socks            | 111      | 
      | Hiking Boots            | 108      |
    And I click on the "Place An Order" button
    Then I should see the title "Place Order"
    And I should see the following order details:
      | Qty  | Product Description     | Delivery Status | Unit Price | Total Price |
      | 100  | External Frame Backpack | To Be Shipped   | $ 179.95   | $ 17995.00  |
      | 111  | Padded Socks            | To Be Shipped   | $ 19.99    | $ 2218.89   |
      | 108  | Hiking Boots            | To Be Shipped   | $ 109.90   | $ 11869.20  |
    And I should see more information about the order:
      | Product Total             | $ 32083.09 |
      | Sales Tax                 | $ 1604.15  |
      | Shipping & Handling       | $ 5.00     |
      | Grand Total               | $ 33692.24 |


Scenario: Put an Order of all items, each with a big order quantity 
    When I add the order:
      | Item                    | Quantity |
      | 3 Person Dome Tent      | 124      |
      | External Frame Backpack | 157      |
      | Glacier Sun Glasses     | 102      |
      | Padded Socks            | 160      |
      | Hiking Boots            | 115      |
      | Back Country Shorts     | 142      |
    And I click on the "Place An Order" button
    Then I should see the title "Place Order"
    And I should see the following order details:
      | Qty | Product Description     | Delivery Status | Unit Price | Total Price |
      | 124 | 3 Person Dome Tent      | To Be Shipped   | $ 299.99   | $ 37198.76  |
      | 157 | External Frame Backpack | To Be Shipped   | $ 179.95   | $ 28252.15  |
      | 102 | Glacier Sun Glasses     | To Be Shipped   | $ 67.99    | $ 6934.98   |
      | 160 | Padded Socks            | To Be Shipped   | $ 19.99    | $ 3198.40   |
      | 115 | Hiking Boots            | To Be Shipped   | $ 109.90   | $ 12638.50  |
      | 142 | Back Country Shorts     | To Be Shipped   | $ 24.95    | $ 3542.90   |
    And I should see more information about the order:
      | Product Total             | $ 91765.69 |
      | Sales Tax                 | $ 4588.28  |
      | Shipping & Handling       | $ 5.00     |
      | Grand Total               | $ 96358.97 |


Scenario: Put an Order of all items, each with a the same big quantity 
    When I add the order:
      | Item                    | Quantity |
      | 3 Person Dome Tent      | 120      |
      | External Frame Backpack | 120      |
      | Glacier Sun Glasses     | 120      |
      | Padded Socks            | 120      |
      | Hiking Boots            | 120      |
      | Back Country Shorts     | 120      |
    And I click on the "Place An Order" button
    Then I should see the title "Place Order"
    And I should see the following order details:
      | Qty | Product Description     | Delivery Status | Unit Price | Total Price |
      | 120 | 3 Person Dome Tent      | To Be Shipped   | $ 299.99   | $ 35998.80  |
      | 120 | External Frame Backpack | To Be Shipped   | $ 179.95   | $ 21594.00  |
      | 120 | Glacier Sun Glasses     | To Be Shipped   | $ 67.99    | $ 8158.80   |
      | 120 | Padded Socks            | To Be Shipped   | $ 19.99    | $ 2398.80   |
      | 120 | Hiking Boots            | To Be Shipped   | $ 109.90   | $ 13188.00  |
      | 120 | Back Country Shorts     | To Be Shipped   | $ 24.95    | $ 2994.00   |
    And I should see more information about the order:
      | Product Total             | $ 84332.40 |
      | Sales Tax                 | $ 4216.62  |
      | Shipping & Handling       | $ 5.00     |
      | Grand Total               | $ 88554.02 |


Scenario: Put an Order of one item with really huge quantity
    When I add the order:
      | Quantity                     | Item               | 
      | 1000000000000000000000000000 | 3 Person Dome Tent |
    And I click on the "Place An Order" button
    Then I should see an alert "Quantity not Allowed"