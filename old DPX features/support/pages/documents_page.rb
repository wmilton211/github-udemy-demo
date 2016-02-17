class DocumentsPage
    
#--starts up the page and variables; also initializes the sleeper function, which is the functionspage class-->
	def initialize(browser)
	@browser = browser
    varInit
    @dafunk = FunctionsPage.new(@browser)
	end

#--declares variables-->
	def varInit
    @userFld = @browser.text_field(:id => "username")
    @documentsLink = @browser.link(:href, "/mods/profile/documents/")
    @uploadLink = @browser.link(:href, "/mods/profile/documents/?action=chooseFile")
    @choosefile = @browser.element(:name=>"file")
    @doctype = @browser.select_list(:name=> "doctype_id")
    @uploadBtn = @browser.button(:index=> 0)
    @cropBtn = @browser.link(:index=> 8)
    @docTable = @browser.table(:class=> "table")
    @fileWindow = @browser.file_field(:name => 'file')
    end

    def docLink
        @documentsLink.click
    end

def threaded
    @uploadLink.click
    uploadProc
end

def uploadProc
    @randNum = rand(1..5)
        newNum = @randNum
        
        case newNum
            when newNum = 1
                @filepath = 'sampledriverslicense_100402877_m.jpg'
            when newNum = 2
                @filepath = 'wisdriverslicense.jpg'
            when newNum = 3
                @filepath = 'Passportsample1.jpg'
            when newNum = 4
                @filepath = 'examplebirthcertificate.jpg'
            when newNum = 5
                @filepath = 'southernelectric.jpg'
            end

    sleep 2
#-------------------------------------------------

  def modify(path)
    path.slice! "support/pages"
    return path
  end

    path = File.dirname(__FILE__)
    modified_path = modify(path)
    local_file = File.join(modified_path, 'step_definitions/docs', @filepath)
    
    @fileWindow.set(local_file)
    @browser.windows.first.use

    if @fileWindow.value == " " then
        uploadProc
    else

    sleep 3
    typeNum = newNum
    case typeNum
        when typeNum = 1
                @doctype.select_value 1
                @@docBfr = "Driver's License"
        when typeNum = 2
                @doctype.select_value 1
                @@docBfr = "Driver's License"
        when typeNum = 3
                @doctype.select_value 2
                @@docBfr = "Passport"
        when typeNum = 4
                @doctype.select_value 6
                @@docBfr = "Birth Certificate"
        when typeNum = 5
                @doctype.select_value 8
                @@docBfr = "Utility Bill"
    end
    
    @uploadBtn.click
    @cropBtn.click
    sleep 3
    @execBtn = @browser.link(:index=> 9).click
    sleep 3

    @@arr = @filepath
    docCheck
    end
end

def docCheck
    @upDoc = @docTable[1][1].text
    #puts "docTable text" << @upDoc
    @@newArr = @@arr.to_s
    #puts "split text" << @@newArr

    @@newDoc = @@newArr.split('.')[0]
    #puts @@newDoc
    
   if @upDoc.include? @@newDoc then
        puts "Upload entry passed"
    else
        fail
    end
end

end