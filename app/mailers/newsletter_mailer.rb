class NewsletterMailer < ApplicationMailer
	def daily_newsletter(user, articles)
	    @user = user
	    @articles = articles
	    puts "hi i am executing newletter mailer for #{user.email}!!!!!!!!!!>>>>>>><<<<<<<<<<<"
	    puts "articles #{@articles.to_json}"
	    mail(to: -> { @user.email}, subject: "Daily Articles")
  	end
end
