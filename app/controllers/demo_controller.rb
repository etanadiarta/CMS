class DemoController < ApplicationController
  
  layout false

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
end
