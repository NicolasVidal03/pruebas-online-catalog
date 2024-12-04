Feature: As an internet user
         I want to see the product details after navigating through the homepage
         So I can learn more about the product and decide if I want to purchase it

Background:
    Given I am on the GMO homepage
    When I click on the "Enter GMO OnLine" button

Scenario Outline: Viewing product details for a product
  And I click on the "<Product Name>" product link
  Then I should see the following details:
    | Unit Price   | <Unit Price>   |
    | In Stock     | <In Stock>     |
    | Item Number  | <Item Number>  |
    | Description  | <Description>  |

Examples:
  | Product Name           | Unit Price   | In Stock | Item Number | Description                                                                                                                                             |
  | 3 Person Dome Tent     | $ 299.99     | 23       | 1000        | Here's a superb three-season mountaineering/backpacking tent at a great price!                                                                          |
  | External Frame Backpack| $ 179.95     | 8        | 1001        | An ideal pack for long trail trips, its strong heli-arc welded 6061-T6 aircraft-quality aluminum frame with V-truss design resists diagonal distortion. |
  | Glacier Sun Glasses    | $ 67.99      | 138      | 1002        | Use these full-coverage, full-protection sun glasses for all your outdoor activities.                                                                   |
  | Padded Socks           | $ 19.99      | 47       | 1003        | These heavyweight socks are designed for long distances. Reinforced heels and flat-seam toes prevent blisters.                                          |
  | Hiking Boots           | $ 109.90     | 32       | 1004        | A solid choice for through-hikes and other demanding backpacking with heavy loads, our boots are surprisingly light--just 2 lbs. 13 oz.                 |
  | Back Country Shorts    | $ 24.95      | 59       | 1005        | Lightweight nylon shorts can take on any activity and double as swimwear.                                                                               |