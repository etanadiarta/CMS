class AccessController < ApplicationController
  
  layout 'admin'
  
  def index
  	#display tect $ links
  end

  def login
  	#display login form
  end

  def attempt_login
  	if params[:username].present? && params[:password].present?
  		found_user = AdminUser.where(:username => params[:username]).first
  		if found_user
  			authorized_user = found_user_authenticate(params[:password])
  		end
  end

  if authorized_user
  	# TODO : mark user as logged in
  	flash[:notice] = "You are now logged in"
  	redirect_to(:action => 'index')
  else
  	flash[:notice] = "Invalid username or password combination"
  	redirect_to(:action => 'login')
  end

  def logout
  	# TODO : mark user as logged out
  	flash[:notice] = "Logged out"
  	redirect_to(:action => "login")
  end
end
end
