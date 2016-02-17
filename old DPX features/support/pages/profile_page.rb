class ProfilePage
    
#--starts up the page and variables; also initializes the sleeper function, which is the functionspage class-->
	def initialize(browser)
	@browser = browser
    varInit
    @dafunk = FunctionsPage.new(@browser)
	end

#--declares variables-->
	def varInit
    @editAddLink = @browser.link(:href, "/mods/profile/edit_address/")
    @phoneField = @browser.text_field(:name => "phone")
    @ssnField = @browser.text_field(:name => "ssn")
    @langSelect = @browser.select_list(:name=> "email_langs_id")
    @updateButton = @browser.button(:index=> 0)
    #@randNum = " "
    #@scrambleLang = " "
    end

#-----generates a random phone number to use and sets the SSN number--->
    def infoGen
        @randNum = rand.to_s[2..11]
        @randNum.insert(3, '-').insert(7, '-')
       
        @phoneField.clear
        @phoneField.set @randNum
        @ssnField.clear
        @ssnField.set "456-78-9012"
        randLang
    end

#-----randomly selects a language to update--->
    def randLang
        @theLang = [1, 3, 4, 5, 6, 7, 8, 9]
        
        @scrambleLang = @theLang.sample
        langNum = @scrambleLang
        
        case langNum
            when langNum = 1
                @langSelect.select_value "1"
            when langNum = 3
                @langSelect.select_value "3"
            when langNum = 4
                @langSelect.select_value "4"
            when langNum = 5
                @langSelect.select_value "5"
            when langNum = 6
                @langSelect.select_value "6"
            when langNum = 7
                @langSelect.select_value "7"
            when langNum = 8
                @langSelect.select_value "8"
            when langNum = 9
                @langSelect.select_value "9"
            end

            @@holdPhone = @randNum
            @@holdLang = langNum
 end


    def editLink
        @editAddLink.click
    end

    def updateLink
        @updateButton.click
    end
#-----makes sure the values entered have been updated--->
    def updateChk
       if @langSelect.value.to_i == @@holdLang.to_i && @phoneField.value.to_i == @@holdPhone.to_i
            puts "The updates have been verified"
        else
            puts "The updates have failed"
        end
    end
end