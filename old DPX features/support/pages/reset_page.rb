class ResetPage

#--starts up the page and variables; also initializes the sleeper function, which is the functionspage class-->
	def initialize(browser)
		@browser = browser
		varInit
		@dafunk = FunctionsPage.new(@browser)
	end

#--decalres variables-->
	def varInit
		@userFld = @browser.text_field(:id => "username")
		@emailFld = @browser.text_field(:id => "email_address")
		@sendBtn = @browser.button(:index=> 0)
		@forgotLink = @browser.link(:href, "/?action=reset-password")
		@userBfr = " "
		@goodEmail = "falarcomyuri@hotmail.com"
		@firstMsg = "Username not found"
		@secondMsg = "Email address not found"
		@thirdMsg = "Email sent"
		@passwrdChk = "Forgot Password"
	end

#--makes sure we are indeed on the Forgot passwrd page-->
  	def passpgchk
    	fail 'browser text did not match expected value' unless @browser.text.include? @passwrdChk
  	end

#--sets the username-->
  	def setname(username)
  		@userFld.set username
  		#@userBfr = username
  	end

#--sets the email address-->
  	def setemail(email)
  		@emailFld.set email
  	end

#--makes sure the email address is formatted correctly and goes to the reset page-->
  	def sendit
  		if @emailFld.value == " " then
  			@sendBtn.click
  		elsif @emailFld.value.include? '@' && '.com' then
  			@sendBtn.click
  		else
  			fail 'not a correct email address!!'
  		end
	end

#--makes sure we see the correct error message based on correct/incorrect entry-->
	def msgchk(msg)
		#bfr = @userBfr
		@dafunk.sleeper(5)
        case msg
            when msg == @firstMsg then
            	fail 'browser text did not match expected value' unless @browser.text.include? @firstMsg
            when msg == @secondMsg then
             	fail 'browser text did not match expected value' unless @browser.text.include? @secondMsg
            when msg == @thirdMsg then
            	fail 'browser text did not match expected value' unless @browser.text.include? @thirdMsg
        end
    end

end