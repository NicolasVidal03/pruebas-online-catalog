Feature: As an internet user
         I want to fill out a billing form to process my order
         So I can make a successful payment and receive my purchased items.

Background:
    Given I am on the GMO homepage
    When I click on the "Enter GMO OnLine" button
    And I set the quantity input to "1" for the "3 Person Dome Tent"
    And I click on the "Place An Order" button
    And I click on the "Proceed With Order" button
    Then I should see the billing form

Scenario Outline: Validating the billing form fields
    When I fill in the billing information:
      | Field              | Value               |
      | Name              | <Name>              |
      | Address           | <Address>           |
      | City              | <City>              |
      | State             | <State>             |
      | Zip               | <Zip>               |
      | Phone             | <Phone>             |
      | E-mail            | <Email>             |
      | Credit Card       | <CreditCard>        |
      | Card Number       | <CardNumber>        |
      | Expiration Date   | <ExpirationDate>    |
    And I fill in the shipping information:
      | Field              | Value               |
      | Name              | <ShipName>          |
      | Address           | <ShipAddress>       |
      | City              | <ShipCity>          |
      | State             | <ShipState>         |
      | Zip               | <ShipZip>           |
      | Phone             | <ShipPhone>         |
    And I click on the "Place The Order" button
    Then I should see the order receipt with Product Total, Sales Tax, Shipping & Handling and Grand Total

Examples:
      | Name          | Address        | City          | State  | Zip    | Phone        | Email          | CardNumber           | ExpirationDate  | CreditCard       | ShipName      | ShipAddress    | ShipCity     | ShipState   | ShipZip  | ShipPhone  |
      | John Doe      | 123 Main St.   | New York      | NY     | 10001  | 555-123-4567 | john@email.com | 1234-1234-1234-1234  | 12/25           | Visa             | Jane Doe      | 123 Main St.   | New York     | NY          | 10001    | 555-567-8901|
      | Alice Smith   | 456 Oak Ave.   | Los Angeles   | CA     | 90001  | 555-987-6543 | alice@email.com| 9876-5432-4587-9876  | 11/26           | MasterCard       | Bob Smith     | 456 Oak Ave.   | Los Angeles  | CA          | 90001    | 555-432-1098|

Scenario Outline: Validating to place an order with missing billing and shipping fields
    When I fill in the billing information:
      | Field              | Value               |
      | Name              | <Name>              |
      | Address           | <Address>           |
      | City              | <City>              |
      | State             | <State>             |
      | Zip               | <Zip>               |
      | Phone             | <Phone>             |
      | E-mail            | <Email>             |
      | Credit Card       | <CreditCard>        |
      | Card Number       | <CardNumber>        |
      | Expiration Date   | <ExpirationDate>    |
    And I fill in the shipping information:
      | Field              | Value               |
      | Name              | <ShipName>          |
      | Address           | <ShipAddress>       |
      | City              | <ShipCity>          |
      | State             | <ShipState>         |
      | Zip               | <ShipZip>           |
      | Phone             | <ShipPhone>         |
    And I click on the "Place The Order" button
    Then I see a confirmation dialog with the message "<AlertMessage>"

Examples:
    | Name       | Address    | City     | State | Zip   | Phone        | Email       | CardNumber          | ExpirationDate | CreditCard        | ShipName | ShipAddress  | ShipCity | ShipState | ShipZip | ShipPhone    | AlertMessage                                                                   |
    |            |            |          |       |       |              |             |                     |                | American Express  |          |              |          |           |         |              | This is a required field.                                                      |
    | John Doe   |            |          |       |       |              |             |                     |                | American Express  |          |              |          |           |         |              | This is a required field.                                                      |
    | John Doe   |            |          |       |       |              |             |                     |                | American Express  | Jane Doe |              |          |           |         |              | This is a required field.                                                      |
    | John Doe   | 123 Main St|          |       |       |              |             |                     |                | American Express  | Jane Doe |              |          |           |         |              | This is a required field.                                                      |
    | John Doe   | 123 Main St|          |       |       |              |             |                     |                | American Express  | Jane Doe | 123 Main St  |          |           |         |              | This is a required field.                                                      |
    | John Doe   | 123 Main St| New York |       |       |              |             |                     |                | American Express  | Jane Doe | 123 Main St  |          |           |         |              | This is a required field.                                                      |
    | John Doe   | 123 Main St| New York |       |       |              |             |                     |                | American Express  | Jane Doe | 123 Main St  | New York |           |         |              | This is a required field.                                                      |
    | John Doe   | 123 Main St| New York | NY    |       |              |             |                     |                | American Express  | Jane Doe | 123 Main St  | New York |           |         |              | This is a required field.                                                      |
    | John Doe   | 123 Main St| New York | NY    |       |              |             |                     |                | American Express  | Jane Doe | 123 Main St  | New York | NY        |         |              | Please enter a valid zip code in this field.                                   |
    | John Doe   | 123 Main St| New York | NY    | 10001 |              |             |                     |                | American Express  | Jane Doe | 123 Main St  | New York | NY        |         |              | Please enter a valid zip code in this field.                                   |
    | John Doe   | 123 Main St| New York | NY    | 10001 |              |             |                     |                | American Express  | Jane Doe | 123 Main St  | New York | NY        | 10001   |              | Please enter a valid phone number in this field.                               |
    | John Doe   | 123 Main St| New York | NY    | 10001 | 555-123-4567 |             |                     |                | American Express  | Jane Doe | 123 Main St  | New York | NY        | 10001   |              | Please enter a valid phone number in this field.                               |
    | John Doe   | 123 Main St| New York | NY    | 10001 | 555-123-4567 |             |                     |                | American Express  | Jane Doe | 123 Main St  | New York | NY        | 10001   | 555-567-8901 | Please enter a valid card number of the form '1234-123456-12345' in this field.|
    | John Doe   | 123 Main St| New York | NY    | 10001 | 555-123-4567 |             | 1234-1234-1234-1234 |                | Visa              | Jane Doe | 123 Main St  | New York | NY        | 10001   | 555-567-8901 | Please enter a valid date of the form 'MM/YY' in this field.                   |

Scenario: Copying the billing information to the shipping section when clicking "Same as 'Bill To'"
    When I fill in the billing information:
      | Field              | Value               |
      | Name              | John Doe            |
      | Address           | 123 Main St.        |
      | City              | New York            |
      | State             | NY                  |
      | Zip               | 10001               |
      | Phone             | 555-123-4567        |
      | E-mail            | john@email.com      |
    And I click on the "Same as 'Bill To'" checkbox
    Then the shipping information should be automatically filled with the following:
      | Field             | Value               |
      | Name              | John Doe            |
      | Address           | 123 Main St.        |
      | City              | New York            |
      | State             | NY                  |
      | ZipCode           | 10001               |
      | Phone             | 555-123-4567        |

Scenario Outline: Validating fields wrongly filled for billing and shipping
    When I fill in the billing information:
      | Field            | Value               |
      | Name              | <Name>              |
      | Address           | <Address>           |
      | City              | <City>              |
      | State             | <State>             |
      | Zip               | <Zip>               |
      | Phone             | <Phone>             |
      | E-mail            | <Email>             |
      | Credit Card       | <CreditCard>        |
      | Card Number       | <CardNumber>        |
      | Expiration Date   | <ExpirationDate>    |
    And I fill in the shipping information:
      | Field            | Value               |
      | Name              | <ShipName>          |
      | Address           | <ShipAddress>       |
      | City              | <ShipCity>          |
      | State             | <ShipState>         |
      | Zip               | <ShipZip>           |
      | Phone             | <ShipPhone>         |
    And I click on the "Place The Order" button
    Then I see a confirmation dialog with the message "<AlertMessage>"
    
 Examples:
      | Name     | Address         | City       | State | Zip   | Phone        | Email           | CardNumber        | ExpirationDate  | CreditCard         | ShipName  | ShipAddress | ShipCity | ShipState | ShipZip | ShipPhone    | AlertMessage                                                                   |
      | John Doe | 123 Main St.    | New York   | NY    | 10001 | 555-123-4567 |                 | 1234-123456-12345 | 12/21           | American Express   | John Doe  | 123 Main St.| New York | NY        | 10001   | 555-123-4567 | Please enter a valid date of the form 'MM/YY' in this field.                   |
      | John Doe | 123 Main St.    | New York   | NY    | 000   |              |                 |                   |                 | American Express   | John Doe  | 123 Main St.| New York | NY        |         |              | Please enter a valid zip code in this field.                                   |
      | John Doe | 123 Main St.    | New York   | NY    | 10001 |              |                 |                   |                 | American Express   | John Doe  | 123 Main St.| New York | NY        | 000     |              | Please enter a valid zip code in this field.                                   |
      | John Doe | 123 Main St.    | New York   | NY    | 10001 | 123-123      |                 |                   |                 | American Express   | John Doe  | 123 Main St.| New York | NY        | 10001   |              | Please enter a valid phone number in this field.                               |
      | John Doe | 123 Main St.    | New York   | NY    | 10001 | 555-123-4567 |                 |                   |                 | American Express   | John Doe  | 123 Main St.| New York | NY        | 10001   |    123-123   | Please enter a valid phone number in this field.                               |
      | John Doe | 123 Main St.    | New York   | NY    | 10001 | 555-123-4567 |                 | 1234-1154545      |                 | American Express   | John Doe  | 123 Main St.| New York | NY        | 10001   | 555-1234567  | Please enter a valid card number of the form '1234-123456-12345' in this field.|