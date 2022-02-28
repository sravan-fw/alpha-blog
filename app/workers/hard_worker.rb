class HardWorker
    include Sidekiq::Worker

    Sidekiq.logger = Logger.new(STDOUT)

  def perform(*args)
    User.find_each do |user|
      puts "checking for #{ user.id}"
      @user_followed_list = user.following
      if @user_followed_list.any?
        @followedIds = @user_followed_list.map{|f| f.id}
        puts "followedIds for user #{user.id} are #{ @followedIds}"
        @articles = Article.where("user_id IN (?) and (DATE(created_at) = ?)",@followedIds, Date.today - 1)
        NewsletterMailer.daily_newsletter(user, @articles).deliver_now
     end
    end
  end
end
