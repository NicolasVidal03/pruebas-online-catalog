Feature: As an internet user
         I want to see the product details after navigating through the homepage
         So I can learn more about the product and decide if I want to purchase it

Scenario: Viewing product details for 3 Person Dome Tent
    Given I am on the GMO homepage
    When I click on the "Enter GMO OnLine" button
    And I click on the "3 Person Dome Tent" product link
    Then I should see the following details:
      | Unit Price | $ 299.99 |
      | In Stock   | 23      |
      | Item Number| 1000    |
      | Description| Here's a superb three-season mountaineering/backpacking tent at a great price! |

Scenario: Viewing product details for External Frame Backpack
  Given I am on the GMO homepage
  When I click on the "Enter GMO OnLine" button
  And I click on the "External Frame Backpack" product link
  Then I should see the following details:
    | Unit Price   | $ 179.95 |
    | In Stock     | 8        |
    | Item Number  | 1001     |
    | Description  | An ideal pack for long trail trips, its strong heli-arc welded 6061-T6 aircraft-quality aluminum frame with V-truss design resists diagonal distortion. |

Scenario: Viewing product details for Glacier Sun Glasses
  Given I am on the GMO homepage
  When I click on the "Enter GMO OnLine" button
  And I click on the "Glacier Sun Glasses" product link
  Then I should see the following details:
    | Unit Price   | $ 67.99  |
    | In Stock     | 138      |
    | Item Number  | 1002     |
    | Description  | Use these full-coverage, full-protection sun glasses for all your outdoor activities. |

Scenario: Viewing product details for Padded Socks
  Given I am on the GMO homepage
  When I click on the "Enter GMO OnLine" button
  And I click on the "Padded Socks" product link
  Then I should see the following details:
    | Unit Price   | $ 19.99  |
    | In Stock     | 47       |
    | Item Number  | 1003     |
    | Description  | These heavyweight socks are designed for long distances. Reinforced heels and flat-seam toes prevent blisters. |

Scenario: Viewing product details for Hiking Boots
  Given I am on the GMO homepage
  When I click on the "Enter GMO OnLine" button
  And I click on the "Hiking Boots" product link
  Then I should see the following details:
    | Unit Price   | $ 109.90 |
    | In Stock     | 32       |
    | Item Number  | 1004     |
    | Description  | A solid choice for through-hikes and other demanding backpacking with heavy loads, our boots are surprisingly light--just 2 lbs. 13 oz. |

Scenario: Viewing product details for Back Country Shorts
  Given I am on the GMO homepage
  When I click on the "Enter GMO OnLine" button
  And I click on the "Back Country Shorts" product link
  Then I should see the following details:
    | Unit Price   | $ 24.95  |
    | In Stock     | 59       |
    | Item Number  | 1005     |
    | Description  | Lightweight nylon shorts can take on any activity and double as swimwear. |