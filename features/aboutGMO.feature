Feature: About GMO Site Page
    As a user of GMO OnlineCatalog Page
    I want see information about GMO Web Site
    So I can see how this page is build

Background:
  Given I am on the GMO homepage
  When I click on the "About The GMO Site" button

Scenario: See information about the GMO Site     
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