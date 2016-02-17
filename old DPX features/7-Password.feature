@password
Feature: Password Change 
  As a DPX user
  I want to be able to change my password
  So I can be secure and keep my info private

@editpassword
Scenario: Edit Password
  Given I am on the Login screen
  And I log in successfully
  And I click the My Profile icon
  And I click the Change Password link
  And I update my password
  And I click the Change Password button
  And I click the Logout link
  And I log in with my updated credentials
  And I click the My Profile icon
  And I click the Change Password link
  And I reset my password
  And I click the Change Password button
  When I click the Logout link
  Then I am on the Login screen