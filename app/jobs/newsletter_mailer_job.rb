class NewsletterMailerJob < ActiveJob::Base
  queue_as :default

  def perform(*args)
    puts "********* Hi iam  NewsletterMailerJob ***********"
    #User.pluck(:email)
    @articles = Article.all
    User.find_each do |user|
      NewsletterMailer.daily_newsletter(user, @articles).deliver_now
    end
  end
end
