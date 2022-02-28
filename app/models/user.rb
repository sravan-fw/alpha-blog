class User < ActiveRecord::Base
	# include Elasticsearch::Model
 #  	include Elasticsearch::Model::Callbacks

  # index_name Rails.application.class.parent_name.underscore
  # document_type self.name.downcase

	has_many :articles, dependent: :destroy
	has_many :active_relationships, class_name:  "Relationship",
                                  foreign_key: "follower_id",
                                  dependent:   :destroy

  has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "followed_id",
                                   dependent:   :destroy

  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
                             



	before_save {self.email = email.downcase}
	validates :username, presence: true,
					 uniqueness: { case_sensitive: false }, 
					 length: {minimum: 3, maximum: 25}

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	validates :email, presence: true, 
					 uniqueness: { case_sensitive: false }, 
					 length: {maximum: 105},
					 format: {with: VALID_EMAIL_REGEX}

	has_secure_password



	# returns true if current user is following other user
	def following?(other_user)
		following.include?(other_user)
	end 

	# Follows a user
	def follow(other_user)
		active_relationships.create(followed_id: other_user.id)
	end

	# unfollows a user
	def unfollow(other_user)
		active_relationships.find_by(followed_id: other_user.id).destroy
	end


end