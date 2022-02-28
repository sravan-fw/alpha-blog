class SessionsController < ApplicationController
	
	def new
	end

	def create
		user = User.find_by(email: params[:session][:email].downcase)
		if(user && user.authenticate(params[:session][:password]))
			session[:user_id] = user.id
			flash[:notice] = "Login Successful"
			redirect_to user
		else
			flash.now[:danger] = "Invalid email/password combination"
			render 'new'
		end
	end

	def destroy
		session[:user_id] = nil
		flash[:alert] = "Logout Successful"
		redirect_to root_path
	end

end