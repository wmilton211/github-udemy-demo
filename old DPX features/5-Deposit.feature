@deposit
Feature: Deposit Funds
  As a DPX user
  I want to be able to deposit funds into account
  So I my clients can be able to use the allocated funds

@navto
Scenario Outline: Navigation to the Merchant Account page 
  Given I am on the Login screen
  And I enter "FourCorners" in the username field
  And I enter "test" in the password field
  And I touch Sign In
  And I should see the Dashboard
  And I click the Deposit Funds link
  And I should see the Deposit Funds screen
  And I select "<option>" from the Deposit Option drop-down
  And I select "<account>" from Deposit into Account drop-down
  And I enter "<amount>" into the Amount field
  And I enter "<bankname>" into the Bank Name field
  And I enter "<accountname>" into the Account Name field
  And I enter "This is a QA test run" into the Comments field
  When I click the Submit button
  Then I see my entry in the Activity table

Examples:
| option | account | amount | bankname | accountname |
| Wire Transfer | #103595 Cash Account | 1795.00 | Chase Bank | Personal |
| IBAN | #104315 Incendia Cash Account | 575.00 | Huntington Bank | Business |
| Wire Transfer | #109056 | 200.00 | Chase Bank | Personal |
| IBAN | #110298 Pay2Card Cash Account | 10000.00 | Merill Lynch | Business |
| Wire Transfer | #110310 Mobile Wallet Cash Account | 695.00 | Chase Bank | Personal |