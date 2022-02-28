class SearchController < ApplicationController

	def search
	  query = params[:q].presence && params[:q] 
	  if query 
	  	@articles = Article.search_published(query)
	  end
	end

end