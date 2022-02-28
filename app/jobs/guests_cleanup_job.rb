class GuestsCleanupJob < ActiveJob::Base
  queue_as :default

  def perform(*args)
    puts "!!!!Executing clean up job **********||||"
    UserMailer.welcome_email(User.find(9))
  end
end
