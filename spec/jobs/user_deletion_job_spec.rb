require 'rails_helper'

RSpec.describe UserDeletionJob, type: :job do
  context 'perform_later' do
      it "delete user" do
        @user = User.last
          ActiveJob::Base.queue_adapter = :test

          expect {
            UserDeletionJob.perform_later(@user)
          }.to have_enqueued_job
        end
    end
end
