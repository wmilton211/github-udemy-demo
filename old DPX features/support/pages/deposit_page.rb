class DepositPage

#--starts up the page and variables; also initializes the sleeper function, which is the functionspage class-->
	def initialize(browser)
		@browser = browser
    varInit
    @dafunk = FunctionsPage.new(@browser)
	end

#--declares variables-->
	def varInit
		@depOption = @browser.select_list(:name=> "deposit_option")
		@depAccount = @browser.select_list(:name=> "account_id")
		@amntFld = @browser.text_field(:name => "amount")
		@bankFld = @browser.text_field(:name => "originatingBank")
    @acctFld = @browser.text_field(:name => "bank_account_name")
    @commentFld = @browser.text_field(:name => "comments")
    @sumbitBtn = @browser.button(:index=> 0)
		@logoutLink = @browser.link(:href, "/?mod=logout")
    @depFundslink = @browser.link(:index=> 8)
    @depTitle = "Deposit Funds - DirectPay Express"
    @depTable = @browser.table(:class=> "table")
    @amountBfr = " "
    @bankBfr = " "
  end

#--goes to the Deposit Funds screen-->
	def deplink
    @depFundslink.click
  end

  def chkdepPage
    @dafunk.sleeper(10)
    fail 'browser text did not match expected value' unless @browser.window.title.include? @depTitle
  end

#--fills out form-->
    def selectOp(option)
      @depOption.select (option)
    end

    def selAccnt(account)
      @depAccount.select(account)
    end

    def depAmnt(amount)
      @amntFld.set(amount)
      @dAmount = amount.to_s
      @amountBfr = @dAmount
    end

    def defBank(name)
      @bankFld.set(name)
      @dName = name.to_s 
      @bankBfr = @dName
    end

    def depAccnt(accname)
      @acctFld.set(accname)
    end

    def depCmnt(comment)
      @commentFld.set(comment)
    end

    def depSubmit
      @sumbitBtn.click
    end


    def depConfirm
      #--this line connects with Javascript driver and scrolls the browser window...-->
#--...because tests that use elements that are not visible on the screen will fail--> 
      @browser.driver.execute_script("window.scrollBy(0,400)")

  #-----get how many rows exist in the table --->
      @rowCount = @depTable.rows.length - 1
   
  #----get the data from the last row, which is the last added--->
      @rowData = @depTable.strings 
      @rowProc = p @rowData[@rowCount]
      @rowPrOne = @rowProc[0].to_s
      @rowPrTwo = @rowProc[1].to_s
 
 #----checks to make sure that the entry matches the last table row data--->  
      if @rowPrTwo == @bankBfr && @rowPrOne == @amountBfr then
       puts "entry found"
      else
        puts "no match"
        fail
      end
    end


  end