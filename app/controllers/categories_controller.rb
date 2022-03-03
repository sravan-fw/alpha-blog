class CategoriesController < ApplicationController

	before_action :require_admin_user, except: [:show,:index]
  before_action :set_category, only: [:show, :edit, :update] 


	
	def new
		@category = Category.new
	end


	def create
		@category = Category.new(category_params)
		if @category.save
			flash[:notice] = "Category was successfully created"
			redirect_to @category
		else
			render 'new'
		end
	end

	def index
		@categories = Category.all
	end

	def show	
		@articles = @category.articles
	end

	def edit
	end

	def update
		if @category.update(category_params)
			flash[:notice] = "Category updated successfully"
			redirect_to @category
		else
			render 'edit'
		end
	end


	private

	def category_params
		params.require(:category).permit(:name)
	end

	def require_admin_user
		if !(logged_in? && current_user.admin?)
			flash[:alert] = "Only admins can perform this action"
			redirect_to categories_path
		end
	end

	def set_category
		@category = Category.find_by_id(params[:id])
	end


end