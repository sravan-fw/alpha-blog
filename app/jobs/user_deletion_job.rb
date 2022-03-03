class UserDeletionJob < ActiveJob::Base
  queue_as :default

   rescue_from(ActiveRecord::RecordNotFound) do |exception|
    "i am an error"
   end

  def perform(user)
      puts "Deleting user now #{user.username}" 
      user.destroy
  end
end
