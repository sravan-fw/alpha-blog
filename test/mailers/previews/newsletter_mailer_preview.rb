# Preview all emails at http://localhost:3000/rails/mailers/newsletter_mailer
class NewsletterMailerPreview < ActionMailer::Preview

	def daily_newsletter
	    puts "********* Hi iam  NewsletterMailerJob ***********"
	    @articles = Article.all
	    User.find_each do |user|
	      NewsletterMailer.daily_newsletter(user, @articles).deliver_now
	    end
  	end

end
