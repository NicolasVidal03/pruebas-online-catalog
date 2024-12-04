Feature: Browser Test Page
    As a QA student
    I want to check the behavior of test page
    So I can ensure its correct functionality

Background:
    Given I am on the GMO homepage
    When I click the button "Browser Test Page"

Scenario: See the Browser Test Page           
    Then I should see the title "All Browsers Are Not Created Equal"
    And the table should have headers:
      | Internet Explorer 3.0  |
      | Netscape Navigator 3.0 |
    And the "first" column should contain:
      | Blinking Text  |
      | dot bullets    |
      | circle bullets |
      | square bullets |
    And the "second" column should contain:
      | Colored Horizontal Rules |
      | Definition Text Style (should be an italic font) |
      | Trademarks are important™ |
      | Table Properties |


Scenario: See the Sample Java Page       
    When I click the "java" image
    Then I should see the message "Sample Java Applet"


Scenario: See the ActiveX Page    
    When I click the "ActiveX" image
    Then I should see the ActiveX table:
        | ActiveX TextField: | ActiveX TextField |	 
        |                    |                   |
        | ActiveX ComboBox:  | ActiveX ComboBox	 |
        |                    | ActiveX CheckBox  |
        |                    |                   |
 	    |                    | ActiveX Button    |


Scenario: Push Left or Right Button
    When I click the button " << Left or Right >> "
    Then I see a confirmation dialog with the message "This button AND the GMO image should be on the right edge of the page!"

Scenario: Push the GMO image
    When I click the GMO image
    Then I should see the title "GMO OnLine"