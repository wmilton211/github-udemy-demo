class FunctionsPage

#--starts up the page and variables-->
	def initialize(browser)
		@browser = browser
 end

	def sleeper(clock)
  		n = 0
  		tm = clock
  		every(0.1) do
    	n += 1
    
    		break if n == tm
  			end
		end

 	def every(period)
    base = last = Time.now.to_f
    count = 0

    loop do
      now = Time.now.to_f
      actual_secs = now - base
      expected_secs = period * count
      correction = expected_secs - actual_secs
      correction = -period if correction < -period
      select(nil, nil, nil, period + correction)
      now = Time.now
      last = now.to_f
      count += 1
      yield(now)
    end
  
  end
  
 def buffer(name)
    @theName = name
    return @theName
end

end