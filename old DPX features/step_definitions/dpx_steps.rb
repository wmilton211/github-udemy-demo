# encoding: utf-8
#require 'pretty_face'

#############################
########                    #
########     login          #
########                    #
#############################
Given(/^I am on the Login screen$/) do
  @nav = LogonPage.new(@browser)
  @nav.visit('http://client-stage1.directpayexpress.com/')
end

Given(/^I enter "([^"]*)" in the username field$/) do |username|
  @nav.setname(username)
end

Given(/^I enter "([^"]*)" in the password field$/) do |password|
  @nav.setpass(password)
end

Given(/^I touch Sign In$/) do
  @nav.openup
end

Given(/^I should see the Dashboard$/) do
  @nav.pagechk
end

Given(/^I log out$/) do
  @nav.logout
end

#############################
########                    #
########  Reset Password    #
########                    #
#############################
Given(/^I touch the Forgot Password link$/) do
  @nav.resetpasswrd
end

Given(/^I am on the Forgot Password screen$/) do
  @nav = LogonPage.new(@browser)
  @nav.visit('http://client-stage1.directpayexpress.com/')
  @nav.resetpasswrd
  @newset = ResetPage.new(@browser)
  @newset.passpgchk
end

Given(/^I enter "([^"]*)" in the email address field$/) do |email|
  @newset.setemail(email)
end

Given(/^I touch the Send Temporary Password button$/) do
  @newset.sendit
end

Given(/^I should see the "([^"]*)" message$/) do |msg|
  @newset.msgchk(msg)
end
#############################
########                    #
########  Client Join       #
########                    #
#############################
Given(/^I am on the Dashboard screen$/) do 
  @nav = LogonPage.new(@browser)
  @nav.visit('http://client-stage1.directpayexpress.com/')
  @nav.setname('FourCorners')
  @nav.setpass('test')
  @nav.openup
  @nav.pagechk
end
Given(/^I click the Advanced Settings link$/) do
  @clisign = SignupPage.new(@browser)
  @clisign.openadv
end

Given(/^I click the Client Signup link$/) do
  @clisign.opencli
end

Given(/^I see the signup form$/) do
  @clisign.windowchk
end

Given(/^I enter my information into the form$/) do
  @clisign.formfillin
end

Given(/^I enter international information into the form$/) do
  @clisign.formfillintl
end

Given(/^I click the Join button$/) do
  @clisign.joinup
end

Given(/^I am on the Success screen$/) do
  @clisign.successchk
end

#############################
########                    #
######## Verify New Account #
########                    #
#############################
Given(/^I click the Login button$/) do
  @clisign.startleave
end

Given(/^I click the Logout link$/) do
  @clisign.clilogout
end

Given(/^I login with my new credentials$/) do
  @clisign.clilogin
end

Given(/^I click the My Profile icon$/) do
  @clisign = SignupPage.new(@browser)
  @clisign.cliprofile
end

Given(/^I verify my information$/) do
  @clisign.acctchk
end
#############################
########                    #
########  Deposit Funds     #
########                    #
#############################
Given(/^I click the Deposit Funds link$/) do
  @depo = DepositPage.new(@browser)
  @depo.deplink
end

Given(/^I should see the Deposit Funds screen$/) do 
  @depo.chkdepPage
end

When(/^I select "([^"]*)" from the Deposit Option drop\-down$/) do |option|
  @depo.selectOp(option)
end

When(/^I select "([^"]*)" from Deposit into Account drop\-down$/) do |account|
  @depo.selAccnt(account)
end

When(/^I enter "([^"]*)" into the Amount field$/) do |amount|
  @depo.depAmnt(amount)
end

When(/^I enter "([^"]*)" into the Bank Name field$/) do |name|
  @depo.defBank(name)
end

When(/^I enter "([^"]*)" into the Account Name field$/) do |accname|
  @depo.depAccnt(accname)
end

When(/^I enter "([^"]*)" into the Comments field$/) do |comment|
  @depo.depCmnt(comment)
end

When(/^I click the Submit button$/) do
  @depo.depSubmit
end

Then(/^I see my entry in the Activity table$/) do
  @depo.depConfirm
end
#############################
########                    #
########  Update Info       #
########                    #
#############################
Given(/^I enter my current information into the form$/) do 
  @profile.completeform
end
Given(/^I click the Edit Address link$/) do 
  @profile = ProfilePage.new(@browser)
  @profile.editLink
end
Given(/^I update my information$/) do 
  @profile.infoGen
end
Given(/^I click the Update button$/) do 
  @profile.updateLink
end
Given(/^I verify the information was updated$/) do 
  @profile.updateChk
end
#############################
########                    #
########  Chg Password      #
########                    #
#############################
Given(/^I log in successfully$/) do
  @password = PasswordPage.new(@browser)
  @password.goodLogin
end

Given(/^I click the Change Password link$/) do
  @password.chgPassLink
end

Given(/^I click the Change Password button$/) do
  @password.updatePass
end

Given(/^I log in with my updated credentials$/) do
  @password.updateLogin
end

Given(/^I reset my password$/) do
  @password.defaultInfo
end

Given(/^I update my password$/) do
  @password.updateInfo
end
#############################
########                    #
########  Upload Documents  #
########                    #
#############################
Given(/^I click the Documents link$/) do
  @docs = DocumentsPage.new(@browser)
  @docs.docLink
end

Given(/^I successfully upload my documents$/) do
  @docs.threaded
end

