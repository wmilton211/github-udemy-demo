class PasswordPage
    
#--starts up the page and variables; also initializes the sleeper function, which is the functionspage class-->
	def initialize(browser)
	@browser = browser
    varInit
    @dafunk = FunctionsPage.new(@browser)
	end

#--declares variables-->
	def varInit
    @userFld = @browser.text_field(:id => "username")
    @editPassLink = @browser.link(:href, "/mods/profile/change_password/")
    @passField = @browser.text_field(:id => "password")
    @oldPassField = @browser.text_field(:name => "password")
    @newPassField = @browser.text_field(:name => "new_password")
    @confPassField = @browser.text_field(:name => "new_password_confirm")
    @chgPassButton = @browser.button(:index=> 0)
    @userName = "gambalewmfB"
    @userPass1 = "DWJMP"
    @userPass2 = "swpPk"
    @signBtn = @browser.button(:index=> 0)
    end


    def goodLogin
      @userFld.set @userName
      @passField.set @userPass1
      @signBtn.click
    end

    def updateInfo
        @oldPassField.set @userPass1
        @newPassField.set @userPass2
        @confPassField.set @userPass2
    end

    def updateLogin
      @userFld.set @userName
      @passField.set @userPass2
      @signBtn.click
    end

    def defaultInfo
        @oldPassField.set @userPass2
        @newPassField.set @userPass1
        @confPassField.set @userPass1
    end


    def chgPassLink
        @editPassLink.click
    end

    def updatePass
        @chgPassButton.click
    end

end