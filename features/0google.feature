Feature: As a internet user
         I want to use the google search engine
         so I test that it works correctly

Scenario: Search for the Houston Dynamo Website        
  Given I am on the Google homepage
  When I search for "houston dynamo tickets 2024"
  Then I will click the "2024 Single Match Tickets" link

Scenario: Searching for a UCB Site
  Given I am on the Google homepage
  When I search for "UCB Cochabamba"
  And I will click the "Universidad Católica Boliviana Cochabamba" link  
  Then I see a link for the "SIAAn"
  And I see a link for the "LMS – UCB"
  And I see a link for the "Google Workspace"
  And I see text about working hours "Atención de lunes a viernes de 08:30 a 16:00"
  And I see a direct link for "Calendario Académico"


