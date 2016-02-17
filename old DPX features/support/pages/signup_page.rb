class SignupPage

#--starts up the page and variables; also initializes the sleeper function, which is in the functions page class-->
    def initialize(browser)
        @browser = browser
        varInit
        @dafunk = FunctionsPage.new(@browser)
    end

#--decalres variables-->
    def varInit
    @clientLink = @browser.link(:href, "http://public.directpayexpress.com/join/fe5dbbcea5ce7e2988b8c69bcfdfde8904aabc1f/0/0/none")
    @advSettingsLink = @browser.link(:index=> 7)
    @welcome = "Welcome, we're glad you're here!"
    @firstFld = @browser.text_field(:name => "first_name")
    @lastFld = @browser.text_field(:name => "last_name")
    @emailFld = @browser.text_field(:name => "email")
    @suffField = @browser.text_field(:name => "suffix")
    @address1Field = @browser.text_field(:name => "address")
    @address2Field = @browser.text_field(:name => "address2")
    @countrySelect = @browser.select_list(:name=> "country")
    @nationSelect = @browser.select_list(:name=> "nationality_country")
    @stateSelect = @browser.select_list(:index=> 2)
    @cityField = @browser.text_field(:name => "city")
    @zipField = @browser.text_field(:name => "postal_code")
    @phoneField = @browser.text_field(:name => "phone")
    @cellField = @browser.text_field(:name => "cell_phone")
    @ssnField = @browser.text_field(:name => "ssn")
    @langSelect = @browser.select_list(:name=> "email_langs_id")
    @dobField = @browser.text_field(:name => "dob")
    @loginBtn = @browser.link(:href,'http://client-stage1.directpayexpress.com/')
    @joinBtn = @browser.button(:class=> "btn")
    @forgotLink = @browser.link(:href, "/?action=reset-password")
    @nuWindow = @browser.window(:title => "DirectPay Express")
    @successMsg = "Your profile is under review"
    @logoutLink = @browser.link(:href, "/?mod=logout")
    @myProfile = @browser.link(:href, "/mods/profile/")
end

#--clicks the Advanced Settings Link--> 
    def openadv
      @advSettingsLink.click
    end

#--this redirects the page to the client join form without clicking on the link; clicking opens the form in a new window...-->
#--...which is difficult to manipulate with Watir/Selenium.-->
    def opencli
      @browser.goto "http://public-stage1.directpayexpress.com/join/fe5dbbcea5ce7e2988b8c69bcfdfde8904aabc1f/0/0/none/"
    end

#--thid pauses all action via my sleeper method and gives the page time to load in order to be chk'd-->
    def windowchk
      @dafunk.sleeper(20)
      fail 'browser text did not match expected value' unless @browser.text.include? @welcome
    end
   
#--sets the form with US client setup values-->
    def formfillin
        @firstFld.set "Franco"
        @lastFld.set "Gambale"

#--this concatenates the First name and Last name entered into a string we will use later for verification-->
        @@theName = @firstFld.value << " " << @lastFld.value
        puts @@theName
 
        @suffField.set "Mr."
        @emailFld.set "fg@gambale.com"
        @address1Field.set "123 CleanSweep Lane"
        @address2Field.set "Suite MI90"
        @countrySelect.select "United States"
        @nationSelect.select "United States"
#--this line connects with Javascript driver and scrolls the browser window...-->
#--...because tests that use elements that are not visible on the screen will fail--> 
        @browser.driver.execute_script("window.scrollBy(0,200)")
        @dafunk.sleeper(15)
        @stateSelect.select "California" 
        @cityField.set "San Francisco"
        @zipField.set "90210"
        @phoneField.set "310-341-9185"
        @cellField.set "323-883-3687"
        @ssnField.set "987-65-4321"
        @langSelect.select "English"
        @dobField.set "April 15, 1971"
    end

#--signs up an international client-->
        def formfillintl
        @firstFld.set "Peter"
        @lastFld.set "O'Toole"

        #--this concatenates the First name and Last name into a string we will use later for verification-->
        @@theName = @firstFld.value << " " << @lastFld.value
        puts @@theName
 
        @suffField.set "Mr."
        @emailFld.set "pot211@gmail.com"
        @address1Field.set "902AM Jalalabad Road"
        @address2Field.set "P.O. Box 54"
        @countrySelect.select "Afghanistan"
        @nationSelect.select "Afghanistan"

#--this line connects with Javascript driver and scrolls the browser window...-->
#--...because tests that use elements that are not visible on the screen will fail--> 
        @browser.driver.execute_script("window.scrollBy(0,400)")
        @dafunk.sleeper(15)
        @stateSelect.select "OTHER"
        @cityField.set "Kabul"
        @zipField.set "0101 AF.KB.KB"
        @phoneField.set "7 9050.7002"
        @cellField.set "7 9050.7000"
        @ssnField.set "987-65-4321"
        @langSelect.select "English"
        @dobField.set "July 23, 1967"
        end

#--clicks the Join button-->
    def joinup
      @joinBtn.click
    end
#--makes sure we see the success message at the end or the client signup has failed-->
    def successchk
        @joinName = @browser.span(:id=> "join_username").text
        @joinPass = @browser.span(:id=> "join_password").text
   
      if @browser.text.include? @successMsg then
        else 
        fail 'browser text did not match expected value'
      end
    end

#--takes out to a page where we can logout even tho it says 'Login'-->
    def startleave
        @loginBtn.click
    end

#--actually logs us out-->    
    def clilogout
        @logoutLink.click
    end 

#--logs us in using the new credentials we got after creating the acct-->
    def clilogin
        @nav = LogonPage.new(@browser)
        @nav.setname(@joinName)
        @nav.setpass(@joinPass)
        @nav.openup
    end

#-clicks the My Profile icon/link in the nav bar-->
    def cliprofile
        @myProfile.click
    end

#--reads the client name in the profile and compares is to the string 'theName'-->
#-- if they match; success msg and exit; if not, show fail msg-->
    def acctchk
        puts @@theName
        fail 'browser text did not match expected value' unless @browser.text.include? @@theName
    end
end