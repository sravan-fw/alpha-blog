class CommentsController < ApplicationController

	def create
		@article = Article.find_by_id(params[:article_id])
	 	@comment = @article.comments.new comment_params
	 	@comment.commenter = current_user.username
	 	@comment.save
		redirect_to article_path(@article)
	end

	def destroy
		@article = Article.find_by_id(params[:article_id])
		@comment=  @article.comments.find_by_id(params[:id])
		@comment.destroy
		redirect_to article_path(@article)
	end

	private
	def comment_params
		params.require(:comment).permit(:body)
	end
end
