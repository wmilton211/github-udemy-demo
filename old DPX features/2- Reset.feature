@reset
Feature: Reset Password
  As a DPX user
  I want to be able to reset my password
  So I can have access to my account

  Background:
    Given I am on the Forgot Password screen

@wrongnamereset
Scenario: Invalid username
  When I enter "AcmeCorp" in the username field
  And I enter "falarcomyuri@hotmail.com" in the email address field
  And I touch the Send Temporary Password button
  Then I should see the "Username not found" message

@wrongpassreset
Scenario: Invalid password
  When I enter "desouzahJ2z" in the username field
  And I enter "here@there.com" in the email address field
  And I touch the Send Temporary Password button
  Then I should see the "Email address not found" message

@blankpassreset
Scenario: Blank username/password
  When I enter " " in the username field
  And I enter " " in the email address field
  And I touch the Send Temporary Password button
  Then I should see the "Username not found" message

@successreset
Scenario: successful Forgot Password
  When I enter "desouzahJ2z" in the username field
  And I enter "falarcomyuri@hotmail.com" in the email address field
  And I touch the Send Temporary Password button
  Then I am on the Login screen
  And I should see the "Email sent" message 