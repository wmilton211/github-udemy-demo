class LogonPage

#--starts up the page and variables; also initializes the sleeper function, which is the functionspage class-->
	def initialize(browser)
		@browser = browser
    varInit
    @dafunk = FunctionsPage.new(@browser)
	end

#--declares variables-->
	def varInit
		@userFld = @browser.text_field(:id => "username")
		@userBfr = " "
		@firstTitle = "DirectPay Express"
		@secondTitle = "My Accounts - DirectPay Express"
		@thirdTitle = "Merchant Account - DirectPay Express"
    @pswdFld = @browser.text_field(:id => "password")
		@signBtn = @browser.button(:index=> 0)
		@logoutLink = @browser.link(:href, "/?mod=logout")
		@signedChk = @browser.checkbox(:id => "Field")
    @forgotLink = @browser.link(:href, "/?action=reset-password")
  end

#--opens the window fullscreen and directs the browser to the site-->
	def visit(whereto)
		@browser.window.maximize
  	@browser.goto whereto
  end

#--sets username-->
  	def setname(username)
  		@userFld.set username
  		@userBfr = username
  	end

#--sets password-->
  	def setpass(password)
  		@pswdFld.set password
  		@dafunk.sleeper(5)
  	end

#--makes sure the 'keep me signed in' chkbox is not checked and signs in-->
  	def openup
  		if @signedChk.checked? != true then
  			@signedChk.set
  			@signedChk.clear
	 		@signBtn.click
	 	else
	 		@signBtn.click
	 	end
	end

#--makes sure we see the correct page based on username-->
	def pagechk
		bfr = @userBfr
		@dafunk.sleeper(5)
        case bfr
            when "admin" then 
            	fail 'browser text did not match expected value' unless @browser.window.title.include? @firstTitle
            when "clarkeYsqL", "4ctopstuff6038", "4cdengotim5167" then
             	fail 'browser text did not match expected value' unless @browser.window.title.include? @secondTitle
            when "FourCorners" then
            	fail 'browser text did not match expected value' unless @browser.window.title.include? @thirdTitle
        end
    end

#--logs out-->
	def logout
		@logoutLink.click
	end

#--clicks the Forgot Password link-->
  def resetpasswrd
    @forgotLink.click
  end



end