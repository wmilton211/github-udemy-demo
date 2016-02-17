@profile
Feature: Profile 
  As a DPX user
  I want to be able to edit my profile
  So I can update my personal information as needed

@editprofile
Scenario: Edit Profile
  Given I am on the Login screen
  And I enter "gambalewmfB" in the username field
  And I enter "DWJMP" in the password field
  And I touch Sign In
  And I should see the Dashboard
  And I click the My Profile icon
  And I click the Edit Address link
  And I update my information
  And I click the Update button
  When I click the My Profile icon
  And I click the Edit Address link
  Then I verify the information was updated