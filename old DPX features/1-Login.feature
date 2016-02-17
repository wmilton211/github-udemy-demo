@login
Feature: Login
  As a DPX user
  I want to be able to login to the DPX site
  So I can begin managing my accounts

  Background:
    Given I am on the Login screen

@wrongname
Scenario: Unsuccessful wrong name Login
  When I enter "AcmeCorp" in the username field
  And I enter "test" in the password field
  And I touch Sign In
  Then I am on the Login screen

@wrongpass
Scenario: Unsuccessful passwrd Login
  When I enter "FourCorners" in the username field
  And I enter "acmepass" in the password field
  And I touch Sign In
  Then I am on the Login screen

@blankname
Scenario: Unsuccessful blank name Login 
  When I enter " " in the username field
  And I enter "test" in the password field
  And I touch Sign In
  Then I am on the Login screen
  
@blankpass
Scenario: Unsuccessful blank pass Login 
  When I enter "FourCorners" in the username field
  And I enter " " in the password field
  And I touch Sign In
  Then I am on the Login screen

@goodlogin
Scenario Outline: Successful Login 
  When I enter "<username>" in the username field
  And I enter "<password>" in the password field
  And I touch Sign In
  And I should see the Dashboard
  Then I log out

Examples:
| username | password |
| FourCorners | test |
| ClarkeYsql | test |
| 4ctopstuff6038 | test |
| 4cdengotim5167 | test |
| admin | EV4Ss548Ds1HplFMfaZc |

@forgotpass
Scenario: Forgot Password
  When I touch the Forgot Password link
  Then I am on the Forgot Password screen
