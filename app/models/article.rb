require 'elasticsearch/model'

class Article < ActiveRecord::Base
	include Elasticsearch::Model
  	include Elasticsearch::Model::Callbacks

	index_name Rails.application.class.parent_name.underscore
  document_type self.name.downcase

  	settings do
	    mappings dynamic: false do
	      # indexes :author, type: :string
	      indexes :title, type: :string, analyzer: :english
	      indexes :description, type: :text, analyzer: :english
	      indexes :user, type: :nested do
	      	indexes :username, type: :string, analyzer: :english
	      	indexes :user_id, type: :integer
	      	indexes :email, type: :string
	      	indexes :admin, type: :boolean	
	      end
	    end
  	end

	validates :title, presence: true, length: {minimum: 6, maximum: 100}
	validates :description, presence: true, length: {minimum: 10, maximum: 3000}
	has_many :comments, dependent: :delete_all

	belongs_to :user
	has_many :article_categories, dependent: :delete_all
	has_many :categories, through: :article_categories

	def self.search_published(query)
	  self.search({
	    query: {
	      bool: {
	        must: [
	        {
	          multi_match: {
	            query: query,
	            fields: [:author, :title, :description]
	          }
	        }
	    	]
	      }
	    }
	  })
	end

	def as_indexed_json(options = nil)
    self.as_json( only: [ :title, :username ] )
  end

	def as_indexed_json(options={})
	  self.as_json(
	    include: { 
	               user:    {only: :username}
	               
	             })
	end

end
