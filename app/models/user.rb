class User < ApplicationRecord
    has_many :posts
    has_many :beers, through: :posts
    #has_many :commented_beers, class_name: :Beer, through: :posts

    has_secure_password
    validates :email, presence: true, uniqueness: true
    validates :username, presence: true, uniqueness: true
end
