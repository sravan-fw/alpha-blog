class UsersController < ApplicationController

	before_action :set_user, only: [:show, :edit, :update, :destroy]
	before_action :require_user, only: [:edit, :update, :following, :followers]
	before_action :require_same_user, only: [:edit, :update, :destroy]

	def index
		@users=User.all
	end

	def show	
		@articles = @user.articles
	end


	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if(@user.save)
			UserMailer.welcome_email(@user).deliver_later
			session[:user_id] = @user.id
			flash[:notice] = "Welcome to my blog #{@user.username} Sign Up is successful"
			redirect_to @user
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		@user.update(user_params)
		if(@user.save)
			flash[:notice] = "User details updated successfully"
			redirect_to user_path
		else
			render 'edit'
		end
	end

 def destroy
	@user.destroy
	session[:user_id] = nil if current_user == @user
	flash[:notice] = "Account and associated articles are deleted successfully"
	redirect_to root_path
 end

 def following
 	@title = "Following"
 	@user = User.find(params[:id])
 	@users = @user.following
 	render 'show_follow'
 end

 def followers
 	@title = "Followers"
 	@user = User.find(params[:id])
 	@users = @user.followers
 	render 'show_follow'

 end



	private

	def user_params
		params.require(:user).permit(:username, :email, :password)
	end

	def set_user
		@user = User.find(params[:id])
	end

	def require_same_user
		if @user != current_user && !current_user.admin?
			flash[:alert] = "You can edit or delete only your profile"
      redirect_to @user
		end
	end
end