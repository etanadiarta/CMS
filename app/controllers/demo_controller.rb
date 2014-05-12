class DemoController < ApplicationController
  
  layout 'application'

  def index
  end

  def hello
  	#render('index')
  	@array = [1,2,3]
    @id = params['id']
    @page = params[:page].to_i
  end

  def other_hello
  	redirect_to(:controller => 'demo', :action => 'index')
  end

  def kaskus
  	redirect_to("http://www.kaskus.co.id/")
  end

  def text_helpers
  end

  def escape_output 
  end

  def make_error
    #My guesses for 3 most commong error:
    #render(:text => "test" # syntax error
    #render(:text => @something.upcase) # undefined method
    #render(:text "1" + 1) #can't convert type 
  end

  def logging
    logger.debug("this is debug")
    logger.info("this is info")
    logger.warn("this is warn")
    logger.error("this is error")
    logger.fatal("this is fatal")
    render(:text => "Logged")
  end
end
