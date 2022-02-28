class UserMailer < ApplicationMailer

	def welcome_email(user)
		@user = user
		@url  = 'http://localhost.com:3000/'
    mail(to: @user.email, 
	    	subject: 'Welcome to Alpha Blog')
	end

end