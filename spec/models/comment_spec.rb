require 'rails_helper'

RSpec.describe Comment, type: :model do
end


RSpec.describe Article do           #
  context 'before Article creation ' do  # (almost) plain English
    it 'cannot have comments' do   #
      expect { Article.create.comments.create! }.to raise_error(ActiveRecord::RecordNotSaved)
    end
  end




end