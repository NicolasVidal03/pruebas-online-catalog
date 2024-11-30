Feature: About GMO Site Page
    As a user of GMO OnlineCatalog Page
    I want see information about GMO Web Site
    So I can see how this page is build

Scenario: See information about the GMO Site      
  Given I am on the GMO page
  When I click in "About The GMO Site"
  Then I should see the title "About This Site"
  And I should see the image "images/gmo-animate.gif"    
  And I should see the following table with technologies:
     | HTML 3.2                 | Style sheets          |
     | HTML Browser Extensions  | Multimedia            |
     | Animation                | VBscript              |
     | JavaScript               | Plug-Ins              |
     | CGI                      | IIOP                  |
     | Java                     | Cookies               |
     | ActiveX                  | Secure transactions   |
     | Client-side processes    | Database access       |
     | Server-side processes    |                       |