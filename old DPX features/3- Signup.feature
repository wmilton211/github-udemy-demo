@signup
Feature: Client Signup
  As a DPX user
  I want to be able to sign up as a merchant
  So I can use my account to disperse funds

@filloutUS
Scenario: Creating a US account
  Given I am on the Dashboard screen
  When I click the Advanced Settings link
  And I click the Client Signup link
  And I see the signup form
  And I enter my information into the form
  And I click the Join button
  And I am on the Success screen
  And I click the Login button
  And I click the Logout link
  And I login with my new credentials
  And I click the My Profile icon
  Then I verify my information


@filloutIntl
Scenario: Creating an Intl account
  Given I am on the Dashboard screen
  And I click the Advanced Settings link
  And I click the Client Signup link
  And I see the signup form
  And I enter international information into the form
  And I click the Join button
  And I am on the Success screen
  And I click the Login button
  And I click the Logout link
  And I login with my new credentials
  And I click the My Profile icon
  Then I verify my information





