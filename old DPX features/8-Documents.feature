@document
Feature: Uploading Documents
  As a DPX user
  I want to be able to upload documents
  So I can have my account validated by the bank 

@uploadDoc
Scenario: Upload Document
  Given I am on the Login screen
  And I log in successfully
  And I click the My Profile icon
  And I click the Documents link
  And I successfully upload my documents
  When I click the Logout link
  Then I am on the Login screen