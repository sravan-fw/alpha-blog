require 'rails_helper'

RSpec.describe UsersController, type: :controller do
	context 'DELETE #destroy' do
		it 'returns error' do
			delete :destroy
			expect(response).to be_success
		end
	end
end
